import 'package:serverpod/serverpod.dart';
import 'package:serverpod_challenge_server/src/generated/challengeException.dart';
import 'package:serverpod_challenge_server/src/generated/tag.dart';
import 'package:serverpod_challenge_server/src/generated/user_tag_relation.dart';

class TagEndpoint extends Endpoint {
  Future<Tag> create(Session session, Tag tag) async {
    try {
      return await session.db.transaction(
        (transaction) async {
          return await Tag.db.insertRow(session, tag);
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
        message: 'Oops, something went wrong',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }

  Future<Tag> update(Session session, Tag tag) async {
    try {
      if (tag.id == null) {
        throw ChallengeException(message: 'Tag id is required');
      }

      return await session.db.transaction(
        (transaction) async {
          // Update tag information
          return await Tag.db.updateRow(session, tag);
        },
      );
    } catch (e, st) {
      session.log(
        'Error while attempting to update tag',
        level: LogLevel.warning,
        exception: e,
        stackTrace: st,
      );

      throw ChallengeException(
        message: 'Error while attempting to update tag',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }

  Future<Tag> delete(Session session, int id) async {
    try {
      final tag = await Tag.db.findById(session, id);

      if (tag == null) {
        throw Exception('Tag not found');
      }

      return await session.db.transaction(
        (transaction) async {
          // Delete all user-tag relationships first
          await UserTag.db.deleteWhere(
            session,
            where: (t) => t.tagId.equals(id),
            transaction: transaction,
          );

          // Then delete the tag
          return await Tag.db.deleteRow(
            session,
            tag,
            transaction: transaction,
          );
        },
      );
    } catch (e, st) {
      session.log(
        'Error while attempting to delete tag',
        level: LogLevel.warning,
        exception: e,
        stackTrace: st,
      );

      throw ChallengeException(
        message: 'Error while attempting to delete tag',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }

  Future<Tag?> getById(Session session, int id) async {
    try {
      return await Tag.db.findById(session, id);
    } catch (e, st) {
      session.log(
        'Error while attempting to get tag',
        level: LogLevel.warning,
        exception: e,
        stackTrace: st,
      );

      throw ChallengeException(
        message: 'Error while attempting to get tag',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }

  Future<List<Tag>> getAll(Session session) async {
    try {
      return await Tag.db.find(session);
    } catch (e, st) {
      session.log(
        'Error while fetching tags',
        level: LogLevel.warning,
        exception: e,
        stackTrace: st,
      );

      throw ChallengeException(
        message: 'No tags found',
        debugLog: 'e: $e \n st:$st',
      );
    }
  }
}
