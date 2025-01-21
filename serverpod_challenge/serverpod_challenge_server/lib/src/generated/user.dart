/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'user_tag_relation.dart' as _i2;

abstract class User implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = UserTable();

  static const db = UserRepository._();

  @override
  int? id;

  String name;

  String email;

  String address;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i2.UserTag>? tags;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'address': address,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (tags != null)
        'tags': tags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static UserInclude include({_i2.UserTagIncludeList? tags}) {
    return UserInclude._(tags: tags);
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
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

class UserTable extends _i1.Table {
  UserTable({super.tableRelation}) : super(tableName: 'user') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString email;

  late final _i1.ColumnString address;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserTagTable? ___tags;

  _i1.ManyRelation<_i2.UserTagTable>? _tags;

  _i2.UserTagTable get __tags {
    if (___tags != null) return ___tags!;
    ___tags = _i1.createRelationTable(
      relationFieldName: '__tags',
      field: User.t.id,
      foreignField: _i2.UserTag.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTagTable(tableRelation: foreignTableRelation),
    );
    return ___tags!;
  }

  _i1.ManyRelation<_i2.UserTagTable> get tags {
    if (_tags != null) return _tags!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'tags',
      field: User.t.id,
      foreignField: _i2.UserTag.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTagTable(tableRelation: foreignTableRelation),
    );
    _tags = _i1.ManyRelation<_i2.UserTagTable>(
      tableWithRelations: relationTable,
      table: _i2.UserTagTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _tags!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        email,
        address,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'tags') {
      return __tags;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({_i2.UserTagIncludeList? tags}) {
    _tags = tags;
  }

  _i2.UserTagIncludeList? _tags;

  @override
  Map<String, _i1.Include?> get includes => {'tags': _tags};

  @override
  _i1.Table get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attach = const UserAttachRepository._();

  final attachRow = const UserAttachRowRepository._();

  final detach = const UserDetachRepository._();

  final detachRow = const UserDetachRowRepository._();

  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRepository {
  const UserAttachRepository._();

  Future<void> tags(
    _i1.Session session,
    User user,
    List<_i2.UserTag> userTag, {
    _i1.Transaction? transaction,
  }) async {
    if (userTag.any((e) => e.id == null)) {
      throw ArgumentError.notNull('userTag.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $userTag = userTag.map((e) => e.copyWith(userId: user.id)).toList();
    await session.db.update<_i2.UserTag>(
      $userTag,
      columns: [_i2.UserTag.t.userId],
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  Future<void> tags(
    _i1.Session session,
    User user,
    _i2.UserTag userTag, {
    _i1.Transaction? transaction,
  }) async {
    if (userTag.id == null) {
      throw ArgumentError.notNull('userTag.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $userTag = userTag.copyWith(userId: user.id);
    await session.db.updateRow<_i2.UserTag>(
      $userTag,
      columns: [_i2.UserTag.t.userId],
      transaction: transaction,
    );
  }
}

class UserDetachRepository {
  const UserDetachRepository._();

  Future<void> tags(
    _i1.Session session,
    List<_i2.UserTag> userTag, {
    _i1.Transaction? transaction,
  }) async {
    if (userTag.any((e) => e.id == null)) {
      throw ArgumentError.notNull('userTag.id');
    }

    var $userTag = userTag.map((e) => e.copyWith(userId: null)).toList();
    await session.db.update<_i2.UserTag>(
      $userTag,
      columns: [_i2.UserTag.t.userId],
      transaction: transaction,
    );
  }
}

class UserDetachRowRepository {
  const UserDetachRowRepository._();

  Future<void> tags(
    _i1.Session session,
    _i2.UserTag userTag, {
    _i1.Transaction? transaction,
  }) async {
    if (userTag.id == null) {
      throw ArgumentError.notNull('userTag.id');
    }

    var $userTag = userTag.copyWith(userId: null);
    await session.db.updateRow<_i2.UserTag>(
      $userTag,
      columns: [_i2.UserTag.t.userId],
      transaction: transaction,
    );
  }
}
