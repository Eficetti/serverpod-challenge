import 'package:serverpod_challenge_server/src/generated/tag.dart';
import 'package:test/test.dart';
import '../integration/test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given Tag endpoint',
      rollbackDatabase: RollbackDatabase.disabled, (sessionBuilder, endpoints) {
    setUp(() async {
      sessionBuilder.build();
    });

    tearDown(() async {
      final tags = await endpoints.tag.getAll(sessionBuilder);
      for (var tag in tags) {
        await endpoints.tag.delete(sessionBuilder, tag.id!);
      }

      final users = await endpoints.user.getAll(sessionBuilder);
      for (var user in users) {
        await endpoints.user.delete(sessionBuilder, user.id!);
      }
    });

    test('when creating tag without users then tag is created successfully',
        () async {
      final tagToCreate = Tag(
        name: 'Developer',
        image: 'dev.jpg',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        users: [],
      );

      final createdTag =
          await endpoints.tag.create(sessionBuilder, tagToCreate);

      expect(createdTag.id, isNotNull);
      expect(createdTag.name, equals('Developer'));
      expect(createdTag.image, equals('dev.jpg'));
      expect(createdTag.users, isEmpty);
    });

    test('when getting tag by id then returns correct tag', () async {
      // Create initial tag
      final tagToCreate = Tag(
        name: 'Product Owner',
        image: 'po.jpg',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        users: [],
      );
      final createdTag =
          await endpoints.tag.create(sessionBuilder, tagToCreate);

      // Get tag by id
      final retrievedTag =
          await endpoints.tag.getById(sessionBuilder, createdTag.id!);

      expect(retrievedTag?.name, equals('Product Owner'));
      expect(retrievedTag?.image, equals('po.jpg'));
    });

    test('when updating tag then returns updated tag', () async {
      // Create initial tag
      final tagToCreate = Tag(
        name: 'Old Tag',
        image: 'old.jpg',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        users: [],
      );
      final createdTag =
          await endpoints.tag.create(sessionBuilder, tagToCreate);

      // Update tag
      final tagToUpdate = Tag(
        id: createdTag.id,
        name: 'New Tag',
        image: 'new.jpg',
        createdAt: createdTag.createdAt,
        updatedAt: DateTime.now(),
        users: [],
      );

      final updatedTag =
          await endpoints.tag.update(sessionBuilder, tagToUpdate);

      expect(updatedTag.name, equals('New Tag'));
      expect(updatedTag.image, equals('new.jpg'));
    });

    test('when deleting tag then tag is removed', () async {
      // Create tag
      final tagToCreate = Tag(
        name: 'Temporary',
        image: 'temp.jpg',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        users: [],
      );
      final createdTag =
          await endpoints.tag.create(sessionBuilder, tagToCreate);

      // Delete tag
      await endpoints.tag.delete(sessionBuilder, createdTag.id!);

      // Try to get deleted tag
      final deletedTag =
          await endpoints.tag.getById(sessionBuilder, createdTag.id!);
      expect(deletedTag, isNull);
    });

    test('when getting all tags then returns list of tags', () async {
      // Create multiple tags
      final tag1 = Tag(
        name: 'Tag One',
        image: 'one.jpg',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        users: [],
      );
      final tag2 = Tag(
        name: 'Tag Two',
        image: 'two.jpg',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        users: [],
      );

      await endpoints.tag.create(sessionBuilder, tag1);
      await endpoints.tag.create(sessionBuilder, tag2);

      // Get all tags
      final tags = await endpoints.tag.getAll(sessionBuilder);

      expect(tags.length, equals(2));
      expect(
        tags.map((t) => t.name).toList()..sort(),
        equals(['Tag One', 'Tag Two']),
      );
    });

    test('when trying to update non-existent tag then throws exception',
        () async {
      final nonExistentTag = Tag(
        id: -1, // Non-existent ID
        name: 'Non-existent',
        image: 'none.jpg',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        users: [],
      );

      expect(
        () async => await endpoints.tag.update(sessionBuilder, nonExistentTag),
        throwsA(isA<Exception>()),
      );
    });

    test('when trying to delete non-existent tag then throws exception',
        () async {
      expect(
        () async => await endpoints.tag.delete(sessionBuilder, -1),
        throwsA(isA<Exception>()),
      );
    });
  });
}
