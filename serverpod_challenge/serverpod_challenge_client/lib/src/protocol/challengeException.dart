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

abstract class ChallengeException
    implements _i1.SerializableException, _i1.SerializableModel {
  ChallengeException._({
    required this.message,
    this.debugLog,
  });

  factory ChallengeException({
    required String message,
    String? debugLog,
  }) = _ChallengeExceptionImpl;

  factory ChallengeException.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChallengeException(
      message: jsonSerialization['message'] as String,
      debugLog: jsonSerialization['debugLog'] as String?,
    );
  }

  String message;

  String? debugLog;

  ChallengeException copyWith({
    String? message,
    String? debugLog,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      if (debugLog != null) 'debugLog': debugLog,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChallengeExceptionImpl extends ChallengeException {
  _ChallengeExceptionImpl({
    required String message,
    String? debugLog,
  }) : super._(
          message: message,
          debugLog: debugLog,
        );

  @override
  ChallengeException copyWith({
    String? message,
    Object? debugLog = _Undefined,
  }) {
    return ChallengeException(
      message: message ?? this.message,
      debugLog: debugLog is String? ? debugLog : this.debugLog,
    );
  }
}
