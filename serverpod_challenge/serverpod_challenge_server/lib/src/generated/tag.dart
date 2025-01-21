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

abstract class Tag implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = TagTable();

  static const db = TagRepository._();

  @override
  int? id;

  String name;

  String? image;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i2.UserTag>? users;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (image != null) 'image': image,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (users != null)
        'users': users?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static TagInclude include({_i2.UserTagIncludeList? users}) {
    return TagInclude._(users: users);
  }

  static TagIncludeList includeList({
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    TagInclude? include,
  }) {
    return TagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Tag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Tag.t),
      include: include,
    );
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

class TagTable extends _i1.Table {
  TagTable({super.tableRelation}) : super(tableName: 'tag') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    image = _i1.ColumnString(
      'image',
      this,
      hasDefault: true,
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

  late final _i1.ColumnString image;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserTagTable? ___users;

  _i1.ManyRelation<_i2.UserTagTable>? _users;

  _i2.UserTagTable get __users {
    if (___users != null) return ___users!;
    ___users = _i1.createRelationTable(
      relationFieldName: '__users',
      field: Tag.t.id,
      foreignField: _i2.UserTag.t.tagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTagTable(tableRelation: foreignTableRelation),
    );
    return ___users!;
  }

  _i1.ManyRelation<_i2.UserTagTable> get users {
    if (_users != null) return _users!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'users',
      field: Tag.t.id,
      foreignField: _i2.UserTag.t.tagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTagTable(tableRelation: foreignTableRelation),
    );
    _users = _i1.ManyRelation<_i2.UserTagTable>(
      tableWithRelations: relationTable,
      table: _i2.UserTagTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _users!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        image,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'users') {
      return __users;
    }
    return null;
  }
}

class TagInclude extends _i1.IncludeObject {
  TagInclude._({_i2.UserTagIncludeList? users}) {
    _users = users;
  }

  _i2.UserTagIncludeList? _users;

  @override
  Map<String, _i1.Include?> get includes => {'users': _users};

  @override
  _i1.Table get table => Tag.t;
}

class TagIncludeList extends _i1.IncludeList {
  TagIncludeList._({
    _i1.WhereExpressionBuilder<TagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Tag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Tag.t;
}

class TagRepository {
  const TagRepository._();

  final attach = const TagAttachRepository._();

  final attachRow = const TagAttachRowRepository._();

  final detach = const TagDetachRepository._();

  final detachRow = const TagDetachRowRepository._();

  Future<List<Tag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.find<Tag>(
      where: where?.call(Tag.t),
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Tag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.findFirstRow<Tag>(
      where: where?.call(Tag.t),
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Tag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.findById<Tag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Tag>> insert(
    _i1.Session session,
    List<Tag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Tag>(
      rows,
      transaction: transaction,
    );
  }

  Future<Tag> insertRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Tag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Tag>> update(
    _i1.Session session,
    List<Tag> rows, {
    _i1.ColumnSelections<TagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Tag>(
      rows,
      columns: columns?.call(Tag.t),
      transaction: transaction,
    );
  }

  Future<Tag> updateRow(
    _i1.Session session,
    Tag row, {
    _i1.ColumnSelections<TagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Tag>(
      row,
      columns: columns?.call(Tag.t),
      transaction: transaction,
    );
  }

  Future<List<Tag>> delete(
    _i1.Session session,
    List<Tag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Tag>(
      rows,
      transaction: transaction,
    );
  }

  Future<Tag> deleteRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Tag>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Tag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Tag>(
      where: where(Tag.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Tag>(
      where: where?.call(Tag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TagAttachRepository {
  const TagAttachRepository._();

  Future<void> users(
    _i1.Session session,
    Tag tag,
    List<_i2.UserTag> userTag, {
    _i1.Transaction? transaction,
  }) async {
    if (userTag.any((e) => e.id == null)) {
      throw ArgumentError.notNull('userTag.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $userTag = userTag.map((e) => e.copyWith(tagId: tag.id)).toList();
    await session.db.update<_i2.UserTag>(
      $userTag,
      columns: [_i2.UserTag.t.tagId],
      transaction: transaction,
    );
  }
}

class TagAttachRowRepository {
  const TagAttachRowRepository._();

  Future<void> users(
    _i1.Session session,
    Tag tag,
    _i2.UserTag userTag, {
    _i1.Transaction? transaction,
  }) async {
    if (userTag.id == null) {
      throw ArgumentError.notNull('userTag.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $userTag = userTag.copyWith(tagId: tag.id);
    await session.db.updateRow<_i2.UserTag>(
      $userTag,
      columns: [_i2.UserTag.t.tagId],
      transaction: transaction,
    );
  }
}

class TagDetachRepository {
  const TagDetachRepository._();

  Future<void> users(
    _i1.Session session,
    List<_i2.UserTag> userTag, {
    _i1.Transaction? transaction,
  }) async {
    if (userTag.any((e) => e.id == null)) {
      throw ArgumentError.notNull('userTag.id');
    }

    var $userTag = userTag.map((e) => e.copyWith(tagId: null)).toList();
    await session.db.update<_i2.UserTag>(
      $userTag,
      columns: [_i2.UserTag.t.tagId],
      transaction: transaction,
    );
  }
}

class TagDetachRowRepository {
  const TagDetachRowRepository._();

  Future<void> users(
    _i1.Session session,
    _i2.UserTag userTag, {
    _i1.Transaction? transaction,
  }) async {
    if (userTag.id == null) {
      throw ArgumentError.notNull('userTag.id');
    }

    var $userTag = userTag.copyWith(tagId: null);
    await session.db.updateRow<_i2.UserTag>(
      $userTag,
      columns: [_i2.UserTag.t.tagId],
      transaction: transaction,
    );
  }
}
