import 'package:serverpod_challenge_server/src/generated/tag.dart';
import 'package:serverpod_challenge_server/src/generated/user.dart';
import 'package:test/test.dart';
import '../integration/test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given User endpoint',
      rollbackDatabase: RollbackDatabase.disabled, (sessionBuilder, endpoints) {
    setUp(() {
      sessionBuilder.build();
    });

    tearDown(() async {
      try {
        final users = await endpoints.user.getAll(sessionBuilder);
        for (var user in users) {
          await endpoints.user.delete(sessionBuilder, user.id!);
        }

        final tags = await endpoints.tag.getAll(sessionBuilder);
        for (var tag in tags) {
          await endpoints.tag.delete(sessionBuilder, tag.id!);
        }
      } catch (e) {
        // Ignore cleanup errors
      }
    });

    test('when creating user without tags then user is created successfully',
        () async {
      final now = DateTime.now();
      final userToCreate = User(
        name: 'John Doe',
        email: 'john@example.com',
        address: '123 Main St',
        createdAt: now,
        updatedAt: now,
        tags: [],
      );

      final createdUser =
          await endpoints.user.create(sessionBuilder, userToCreate, []);

      expect(createdUser.id, isNotNull);
      expect(createdUser.name, equals('John Doe'));
      expect(createdUser.email, equals('john@example.com'));
      expect(createdUser.tags, isEmpty);
    });

    test('when creating user with one tag then relationship is created',
        () async {
      // Create tag first
      final now = DateTime.now();
      final tagToCreate = Tag(
        name: 'Developer',
        image: 'dev.jpg',
        createdAt: now,
        updatedAt: now,
        users: [],
      );
      final createdTag =
          await endpoints.tag.create(sessionBuilder, tagToCreate);

      // Create user with tag
      final userToCreate = User(
        name: 'Jane Doe',
        email: 'jane@example.com',
        address: '456 Oak St',
        createdAt: now,
        updatedAt: now,
        tags: [],
      );

      final createdUser = await endpoints.user.create(
        sessionBuilder,
        userToCreate,
        [createdTag],
      );

      expect(createdUser.id, isNotNull);
      expect(createdUser.name, equals('Jane Doe'));

      // Verify the tag relationship
      final users = await endpoints.user.getAll(sessionBuilder);
      final userWithTags = users.firstWhere((u) => u.id == createdUser.id);
      expect(userWithTags.tags?.length, equals(1));
      expect(userWithTags.tags?.first.tag?.name, equals('Developer'));
    });

    test('when getting all users then returns list with their tags', () async {
      final now = DateTime.now();
      // Create tag
      final tag = await endpoints.tag.create(
        sessionBuilder,
        Tag(
          name: 'TestTag',
          image: 'test.jpg',
          createdAt: now,
          updatedAt: now,
          users: [],
        ),
      );

      // Create users
      final user1 = User(
        name: 'User One',
        email: 'user1@example.com',
        address: 'Address 1',
        createdAt: now,
        updatedAt: now,
        tags: [],
      );

      await endpoints.user.create(sessionBuilder, user1, [tag]);

      final users = await endpoints.user.getAll(sessionBuilder);
      expect(users.length, equals(1));

      final userWithTag = users.first;
      expect(userWithTag.tags?.length, equals(1));
      expect(userWithTag.tags?.first.tag?.name, equals('TestTag'));
    });

    test('when updating user then returns updated user', () async {
      final now = DateTime.now();
      // Create initial user
      final userToCreate = User(
        name: 'Bob Brown',
        email: 'bob@example.com',
        address: '321 Elm St',
        createdAt: now,
        updatedAt: now,
        tags: [],
      );

      final createdUser =
          await endpoints.user.create(sessionBuilder, userToCreate, []);

      final updatedNow = DateTime.now();
      final userToUpdate = User(
        id: createdUser.id,
        name: 'Bob Brown Jr',
        email: 'bob.jr@example.com',
        address: '322 Elm St',
        createdAt: createdUser.createdAt,
        updatedAt: updatedNow,
        tags: [],
      );

      final updatedUser =
          await endpoints.user.update(sessionBuilder, userToUpdate);

      expect(updatedUser.name, equals('Bob Brown Jr'));
      expect(updatedUser.email, equals('bob.jr@example.com'));
      expect(updatedUser.address, equals('322 Elm St'));
    });

    test('when deleting user then user and relationships are removed',
        () async {
      final now = DateTime.now();
      // Create tag
      final tag = await endpoints.tag.create(
        sessionBuilder,
        Tag(
          name: 'TestTag',
          image: 'test.jpg',
          createdAt: now,
          updatedAt: now,
          users: [],
        ),
      );

      // Create user with tag
      final userToCreate = User(
        name: 'Test User',
        email: 'test@example.com',
        address: 'Test Address',
        createdAt: now,
        updatedAt: now,
        tags: [],
      );

      final createdUser =
          await endpoints.user.create(sessionBuilder, userToCreate, [tag]);

      // Verify user exists with tag
      final usersBeforeDelete = await endpoints.user.getAll(sessionBuilder);
      expect(usersBeforeDelete.length, equals(1));
      expect(usersBeforeDelete.first.tags?.length, equals(1));

      // Delete user
      await endpoints.user.delete(sessionBuilder, createdUser.id!);

      // Verify user was deleted
      final usersAfterDelete = await endpoints.user.getAll(sessionBuilder);
      expect(usersAfterDelete, isEmpty);

      // Verify tag still exists
      final existingTags = await endpoints.tag.getAll(sessionBuilder);
      expect(existingTags.length, equals(1));
    });
  });
}
