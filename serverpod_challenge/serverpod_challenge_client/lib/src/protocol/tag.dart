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
import 'user_tag_relation.dart' as _i2;

abstract class Tag implements _i1.SerializableModel {
  Tag._({
    this.id,
    required this.name,
    String? image,
    required this.createdAt,
    required this.updatedAt,
    this.users,
  }) : image = image ?? 'default.jpg';

  factory Tag({
    int? id,
    required String name,
    String? image,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<_i2.UserTag>? users,
  }) = _TagImpl;

  factory Tag.fromJson(Map<String, dynamic> jsonSerialization) {
    return Tag(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      image: jsonSerialization['image'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      users: (jsonSerialization['users'] as List?)
          ?.map((e) => _i2.UserTag.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? image;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i2.UserTag>? users;

  Tag copyWith({
    int? id,
    String? name,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.UserTag>? users,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (image != null) 'image': image,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (users != null) 'users': users?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TagImpl extends Tag {
  _TagImpl({
    int? id,
    required String name,
    String? image,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<_i2.UserTag>? users,
  }) : super._(
          id: id,
          name: name,
          image: image,
          createdAt: createdAt,
          updatedAt: updatedAt,
          users: users,
        );

  @override
  Tag copyWith({
    Object? id = _Undefined,
    String? name,
    Object? image = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? users = _Undefined,
  }) {
    return Tag(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      image: image is String? ? image : this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      users: users is List<_i2.UserTag>?
          ? users
          : this.users?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
