import 'package:serverpod/serverpod.dart';
import 'package:serverpod_challenge_server/src/generated/challengeException.dart';
import 'package:serverpod_challenge_server/src/generated/user.dart';
import 'package:serverpod_challenge_server/src/generated/tag.dart';
import 'package:serverpod_challenge_server/src/generated/user_tag_relation.dart';

class UserEndpoint extends Endpoint {
  Future<User> create(Session session, User user, List<Tag>? userTags) async {
    try {
      final userCreated = await session.db.transaction(
        (transaction) async {
          // Insert the user first
          final createdUser = await User.db.insertRow(session, user);

          // If tags are provided, create the relationships
          if (userTags != null && userTags.isNotEmpty) {
            for (var tag in userTags) {
              await UserTag.db.insertRow(
                session,
                UserTag(
                  userId: createdUser.id!,
                  tagId: tag.id!,
                  createdAt: DateTime.now(),
                ),
                transaction: transaction,
              );
            }
          }

          return await getUserById(session, createdUser.id ?? 0);
        },
      );

      if (userCreated == null) {
        throw ChallengeException(
          message: 'User dont exist',
        );
      }

      return await User.db.findById(
            session,
            userCreated.id!,
            include: User.include(
              tags: UserTag.includeList(
                include: UserTag.include(
                  tag: Tag.include(),
                ),
              ),
            ),
          ) ??
          userCreated;
      // Fetch the complete user with tags
    } catch (e, st) {
      session.log(
        'Oops, something went wrong',
        level: LogLevel.warning,
        exception: e,
        stackTrace: st,
      );

      throw ChallengeException(
        message: 'User has missing fields',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }

  Future<List<User>> getAll(Session session) async {
    try {
      return await User.db.find(
        session,
        include: User.include(
          tags: UserTag.includeList(
            include: UserTag.include(
              tag: Tag.include(),
            ),
          ),
        ),
      );
    } catch (e, st) {
      session.log(
        'Oops, something went wrong',
        level: LogLevel.warning,
        exception: e,
        stackTrace: st,
      );

      throw ChallengeException(
        message: 'No users found',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }

  Future<User?> delete(Session session, int id) async {
    try {
      final user = await User.db.findById(session, id);

      if (user == null) {
        throw ChallengeException(message: 'User not found');
      }

      await session.db.transaction(
        (transaction) async {
          // Delete all user-tag relationships first
          await UserTag.db.deleteWhere(
            session,
            where: (t) => t.userId.equals(id),
            transaction: transaction,
          );

          // Then delete the user
          await User.db.deleteRow(
            session,
            user,
            transaction: transaction,
          );
        },
      );

      return user;
    } catch (e, st) {
      session.log(
        'Oops, something went wrong',
        level: LogLevel.warning,
        exception: e,
        stackTrace: st,
      );

      throw ChallengeException(
        message: 'Error while attempting to delete user',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }

  Future<User> update(Session session, User user) async {
    try {
      if (user.id == null) {
        throw ChallengeException(message: 'User id is required');
      }

      final existingUser = await User.db.findById(session, user.id!);

      if (existingUser == null) {
        throw ChallengeException(message: 'User with id ${user.id} not found');
      }

      user = user.copyWith(updatedAt: DateTime.now());

      return await session.db.transaction(
        (transaction) async {
          // Update user information
          return await User.db
              .updateRow(session, user, transaction: transaction);
        },
      );
    } catch (e, st) {
      session.log(
        'Oops, something went wrong',
        level: LogLevel.warning,
        exception: e,
        stackTrace: st,
      );

      throw ChallengeException(
        message: 'Error while attempting to update user',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }

  // Helper method to get tags for a user
  Future<User?> getUserById(
    Session session,
    int userId,
  ) async {
    final user = await User.db.findById(
      session,
      userId,
      include: User.include(
        tags: UserTag.includeList(
          include: UserTag.include(
            tag: Tag.include(),
          ),
        ),
      ),
    );

    return user;
  }

  // Additional methods for tag management
  Future<void> addTag(Session session, int userId, int tagId) async {
    try {
      final userTagExist = await UserTag.db.find(
        session,
        where: (ut) => ut.userId.equals(userId) & ut.tagId.equals(tagId),
      );

      if (userTagExist.isNotEmpty) {
        session.log(
          'Failed to add tag to user, because already exist the relation',
          level: LogLevel.warning,
        );

        throw ChallengeException(
          message:
              'Failed to add tag to user, because already exist the relation',
        );
      }

      await UserTag.db.insertRow(
        session,
        UserTag(
          userId: userId,
          tagId: tagId,
          createdAt: DateTime.now(),
        ),
      );
    } catch (e, st) {
      session.log(
        'Failed to add tag to user',
        level: LogLevel.warning,
        exception: e,
        stackTrace: st,
      );

      throw ChallengeException(
        message: 'Failed to add tag to user',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }

  Future<void> removeTag(Session session, int userId, int tagId) async {
    try {
      await UserTag.db.deleteWhere(
        session,
        where: (t) => t.userId.equals(userId) & t.tagId.equals(tagId),
      );
    } catch (e, st) {
      session.log(
        'Failed to remove tag from user',
        level: LogLevel.warning,
        exception: e,
        stackTrace: st,
      );

      throw ChallengeException(
        message: 'Failed to remove tag from user',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }
}
