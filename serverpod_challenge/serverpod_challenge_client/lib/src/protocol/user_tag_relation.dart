/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'user.dart' as _i2;
import 'tag.dart' as _i3;

abstract class UserTag implements _i1.SerializableModel {
  UserTag._({
    this.id,
    required this.userId,
    this.user,
    required this.tagId,
    this.tag,
    required this.createdAt,
  });

  factory UserTag({
    int? id,
    required int userId,
    _i2.User? user,
    required int tagId,
    _i3.Tag? tag,
    required DateTime createdAt,
  }) = _UserTagImpl;

  factory UserTag.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserTag(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      tagId: jsonSerialization['tagId'] as int,
      tag: jsonSerialization['tag'] == null
          ? null
          : _i3.Tag.fromJson(
              (jsonSerialization['tag'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.User? user;

  int tagId;

  _i3.Tag? tag;

  DateTime createdAt;

  UserTag copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    int? tagId,
    _i3.Tag? tag,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'tagId': tagId,
      if (tag != null) 'tag': tag?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserTagImpl extends UserTag {
  _UserTagImpl({
    int? id,
    required int userId,
    _i2.User? user,
    required int tagId,
    _i3.Tag? tag,
    required DateTime createdAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          tagId: tagId,
          tag: tag,
          createdAt: createdAt,
        );

  @override
  UserTag copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? tagId,
    Object? tag = _Undefined,
    DateTime? createdAt,
  }) {
    return UserTag(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      tagId: tagId ?? this.tagId,
      tag: tag is _i3.Tag? ? tag : this.tag?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
