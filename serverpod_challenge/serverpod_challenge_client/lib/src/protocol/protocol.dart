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
import 'challengeException.dart' as _i2;
import 'example.dart' as _i3;
import 'tag.dart' as _i4;
import 'user.dart' as _i5;
import 'user_tag_relation.dart' as _i6;
import 'package:serverpod_challenge_client/src/protocol/tag.dart' as _i7;
import 'package:serverpod_challenge_client/src/protocol/user.dart' as _i8;
export 'challengeException.dart';
export 'example.dart';
export 'tag.dart';
export 'user.dart';
export 'user_tag_relation.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.ChallengeException) {
      return _i2.ChallengeException.fromJson(data) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data) as T;
    }
    if (t == _i4.Tag) {
      return _i4.Tag.fromJson(data) as T;
    }
    if (t == _i5.User) {
      return _i5.User.fromJson(data) as T;
    }
    if (t == _i6.UserTag) {
      return _i6.UserTag.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ChallengeException?>()) {
      return (data != null ? _i2.ChallengeException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Tag?>()) {
      return (data != null ? _i4.Tag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.User?>()) {
      return (data != null ? _i5.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.UserTag?>()) {
      return (data != null ? _i6.UserTag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i6.UserTag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i6.UserTag>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i6.UserTag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i6.UserTag>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i7.Tag>) {
      return (data as List).map((e) => deserialize<_i7.Tag>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i7.Tag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i7.Tag>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i8.User>) {
      return (data as List).map((e) => deserialize<_i8.User>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.ChallengeException) {
      return 'ChallengeException';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.Tag) {
      return 'Tag';
    }
    if (data is _i5.User) {
      return 'User';
    }
    if (data is _i6.UserTag) {
      return 'UserTag';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'ChallengeException') {
      return deserialize<_i2.ChallengeException>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (dataClassName == 'Tag') {
      return deserialize<_i4.Tag>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i5.User>(data['data']);
    }
    if (dataClassName == 'UserTag') {
      return deserialize<_i6.UserTag>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
