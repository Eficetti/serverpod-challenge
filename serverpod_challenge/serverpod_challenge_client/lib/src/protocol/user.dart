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

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    this.tags,
  });

  factory User({
    int? id,
    required String name,
    required String email,
    required String address,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<_i2.UserTag>? tags,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String,
      address: jsonSerialization['address'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => _i2.UserTag.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String email;

  String address;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i2.UserTag>? tags;

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.UserTag>? tags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'address': address,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (tags != null) 'tags': tags?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String name,
    required String email,
    required String address,
    required DateTime createdAt,
    required DateTime updatedAt,
    List<_i2.UserTag>? tags,
  }) : super._(
          id: id,
          name: name,
          email: email,
          address: address,
          createdAt: createdAt,
          updatedAt: updatedAt,
          tags: tags,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? name,
    String? email,
    String? address,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? tags = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tags: tags is List<_i2.UserTag>?
          ? tags
          : this.tags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
