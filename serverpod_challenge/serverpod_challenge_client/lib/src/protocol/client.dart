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
import 'dart:async' as _i2;
import 'package:serverpod_challenge_client/src/protocol/tag.dart' as _i3;
import 'package:serverpod_challenge_client/src/protocol/user.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointTag extends _i1.EndpointRef {
  EndpointTag(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tag';

  _i2.Future<_i3.Tag> create(_i3.Tag tag) => caller.callServerEndpoint<_i3.Tag>(
        'tag',
        'create',
        {'tag': tag},
      );

  _i2.Future<_i3.Tag> update(_i3.Tag tag) => caller.callServerEndpoint<_i3.Tag>(
        'tag',
        'update',
        {'tag': tag},
      );

  _i2.Future<_i3.Tag> delete(int id) => caller.callServerEndpoint<_i3.Tag>(
        'tag',
        'delete',
        {'id': id},
      );

  _i2.Future<_i3.Tag?> getById(int id) => caller.callServerEndpoint<_i3.Tag?>(
        'tag',
        'getById',
        {'id': id},
      );

  _i2.Future<List<_i3.Tag>> getAll() =>
      caller.callServerEndpoint<List<_i3.Tag>>(
        'tag',
        'getAll',
        {},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i4.User> create(
    _i4.User user,
    List<_i3.Tag>? userTags,
  ) =>
      caller.callServerEndpoint<_i4.User>(
        'user',
        'create',
        {
          'user': user,
          'userTags': userTags,
        },
      );

  _i2.Future<List<_i4.User>> getAll() =>
      caller.callServerEndpoint<List<_i4.User>>(
        'user',
        'getAll',
        {},
      );

  _i2.Future<_i4.User?> delete(int id) => caller.callServerEndpoint<_i4.User?>(
        'user',
        'delete',
        {'id': id},
      );

  _i2.Future<_i4.User> update(_i4.User user) =>
      caller.callServerEndpoint<_i4.User>(
        'user',
        'update',
        {'user': user},
      );

  _i2.Future<_i4.User?> getUserById(int userId) =>
      caller.callServerEndpoint<_i4.User?>(
        'user',
        'getUserById',
        {'userId': userId},
      );

  _i2.Future<void> addTag(
    int userId,
    int tagId,
  ) =>
      caller.callServerEndpoint<void>(
        'user',
        'addTag',
        {
          'userId': userId,
          'tagId': tagId,
        },
      );

  _i2.Future<void> removeTag(
    int userId,
    int tagId,
  ) =>
      caller.callServerEndpoint<void>(
        'user',
        'removeTag',
        {
          'userId': userId,
          'tagId': tagId,
        },
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    example = EndpointExample(this);
    tag = EndpointTag(this);
    user = EndpointUser(this);
  }

  late final EndpointExample example;

  late final EndpointTag tag;

  late final EndpointUser user;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'tag': tag,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
