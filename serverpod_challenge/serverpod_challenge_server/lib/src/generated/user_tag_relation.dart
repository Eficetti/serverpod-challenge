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
import 'user.dart' as _i2;
import 'tag.dart' as _i3;

abstract class UserTag implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = UserTagTable();

  static const db = UserTagRepository._();

  @override
  int? id;

  int userId;

  _i2.User? user;

  int tagId;

  _i3.Tag? tag;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'tagId': tagId,
      if (tag != null) 'tag': tag?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
    };
  }

  static UserTagInclude include({
    _i2.UserInclude? user,
    _i3.TagInclude? tag,
  }) {
    return UserTagInclude._(
      user: user,
      tag: tag,
    );
  }

  static UserTagIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTagTable>? orderByList,
    UserTagInclude? include,
  }) {
    return UserTagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserTag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserTag.t),
      include: include,
    );
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

class UserTagTable extends _i1.Table {
  UserTagTable({super.tableRelation}) : super(tableName: 'user_tag') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    tagId = _i1.ColumnInt(
      'tagId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnInt tagId;

  _i3.TagTable? _tag;

  late final _i1.ColumnDateTime createdAt;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: UserTag.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.TagTable get tag {
    if (_tag != null) return _tag!;
    _tag = _i1.createRelationTable(
      relationFieldName: 'tag',
      field: UserTag.t.tagId,
      foreignField: _i3.Tag.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TagTable(tableRelation: foreignTableRelation),
    );
    return _tag!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        tagId,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'tag') {
      return tag;
    }
    return null;
  }
}

class UserTagInclude extends _i1.IncludeObject {
  UserTagInclude._({
    _i2.UserInclude? user,
    _i3.TagInclude? tag,
  }) {
    _user = user;
    _tag = tag;
  }

  _i2.UserInclude? _user;

  _i3.TagInclude? _tag;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'tag': _tag,
      };

  @override
  _i1.Table get table => UserTag.t;
}

class UserTagIncludeList extends _i1.IncludeList {
  UserTagIncludeList._({
    _i1.WhereExpressionBuilder<UserTagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserTag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => UserTag.t;
}

class UserTagRepository {
  const UserTagRepository._();

  final attachRow = const UserTagAttachRowRepository._();

  Future<List<UserTag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTagTable>? orderByList,
    _i1.Transaction? transaction,
    UserTagInclude? include,
  }) async {
    return session.db.find<UserTag>(
      where: where?.call(UserTag.t),
      orderBy: orderBy?.call(UserTag.t),
      orderByList: orderByList?.call(UserTag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<UserTag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTagTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTagTable>? orderByList,
    _i1.Transaction? transaction,
    UserTagInclude? include,
  }) async {
    return session.db.findFirstRow<UserTag>(
      where: where?.call(UserTag.t),
      orderBy: orderBy?.call(UserTag.t),
      orderByList: orderByList?.call(UserTag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<UserTag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserTagInclude? include,
  }) async {
    return session.db.findById<UserTag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<UserTag>> insert(
    _i1.Session session,
    List<UserTag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserTag>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserTag> insertRow(
    _i1.Session session,
    UserTag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserTag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserTag>> update(
    _i1.Session session,
    List<UserTag> rows, {
    _i1.ColumnSelections<UserTagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserTag>(
      rows,
      columns: columns?.call(UserTag.t),
      transaction: transaction,
    );
  }

  Future<UserTag> updateRow(
    _i1.Session session,
    UserTag row, {
    _i1.ColumnSelections<UserTagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserTag>(
      row,
      columns: columns?.call(UserTag.t),
      transaction: transaction,
    );
  }

  Future<List<UserTag>> delete(
    _i1.Session session,
    List<UserTag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserTag>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserTag> deleteRow(
    _i1.Session session,
    UserTag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserTag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserTag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserTag>(
      where: where(UserTag.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserTag>(
      where: where?.call(UserTag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserTagAttachRowRepository {
  const UserTagAttachRowRepository._();

  Future<void> user(
    _i1.Session session,
    UserTag userTag,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (userTag.id == null) {
      throw ArgumentError.notNull('userTag.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $userTag = userTag.copyWith(userId: user.id);
    await session.db.updateRow<UserTag>(
      $userTag,
      columns: [UserTag.t.userId],
      transaction: transaction,
    );
  }

  Future<void> tag(
    _i1.Session session,
    UserTag userTag,
    _i3.Tag tag, {
    _i1.Transaction? transaction,
  }) async {
    if (userTag.id == null) {
      throw ArgumentError.notNull('userTag.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $userTag = userTag.copyWith(tagId: tag.id);
    await session.db.updateRow<UserTag>(
      $userTag,
      columns: [UserTag.t.tagId],
      transaction: transaction,
    );
  }
}
