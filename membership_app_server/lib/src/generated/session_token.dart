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

abstract class SessionToken implements _i1.TableRow, _i1.ProtocolSerialization {
  SessionToken._({
    this.id,
    required this.tokenHash,
    required this.userId,
    required this.createdAt,
    required this.expiresAt,
  });

  factory SessionToken({
    int? id,
    required String tokenHash,
    required int userId,
    required DateTime createdAt,
    required DateTime expiresAt,
  }) = _SessionTokenImpl;

  factory SessionToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return SessionToken(
      id: jsonSerialization['id'] as int?,
      tokenHash: jsonSerialization['tokenHash'] as String,
      userId: jsonSerialization['userId'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      expiresAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
    );
  }

  static final t = SessionTokenTable();

  static const db = SessionTokenRepository._();

  @override
  int? id;

  String tokenHash;

  int userId;

  DateTime createdAt;

  DateTime expiresAt;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [SessionToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SessionToken copyWith({
    int? id,
    String? tokenHash,
    int? userId,
    DateTime? createdAt,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tokenHash': tokenHash,
      'userId': userId,
      'createdAt': createdAt.toJson(),
      'expiresAt': expiresAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tokenHash': tokenHash,
      'userId': userId,
      'createdAt': createdAt.toJson(),
      'expiresAt': expiresAt.toJson(),
    };
  }

  static SessionTokenInclude include() {
    return SessionTokenInclude._();
  }

  static SessionTokenIncludeList includeList({
    _i1.WhereExpressionBuilder<SessionTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SessionTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SessionTokenTable>? orderByList,
    SessionTokenInclude? include,
  }) {
    return SessionTokenIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SessionToken.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SessionToken.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SessionTokenImpl extends SessionToken {
  _SessionTokenImpl({
    int? id,
    required String tokenHash,
    required int userId,
    required DateTime createdAt,
    required DateTime expiresAt,
  }) : super._(
          id: id,
          tokenHash: tokenHash,
          userId: userId,
          createdAt: createdAt,
          expiresAt: expiresAt,
        );

  /// Returns a shallow copy of this [SessionToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SessionToken copyWith({
    Object? id = _Undefined,
    String? tokenHash,
    int? userId,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) {
    return SessionToken(
      id: id is int? ? id : this.id,
      tokenHash: tokenHash ?? this.tokenHash,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}

class SessionTokenTable extends _i1.Table {
  SessionTokenTable({super.tableRelation}) : super(tableName: 'session_token') {
    tokenHash = _i1.ColumnString(
      'tokenHash',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
  }

  late final _i1.ColumnString tokenHash;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime expiresAt;

  @override
  List<_i1.Column> get columns => [
        id,
        tokenHash,
        userId,
        createdAt,
        expiresAt,
      ];
}

class SessionTokenInclude extends _i1.IncludeObject {
  SessionTokenInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => SessionToken.t;
}

class SessionTokenIncludeList extends _i1.IncludeList {
  SessionTokenIncludeList._({
    _i1.WhereExpressionBuilder<SessionTokenTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SessionToken.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => SessionToken.t;
}

class SessionTokenRepository {
  const SessionTokenRepository._();

  /// Returns a list of [SessionToken]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<SessionToken>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SessionTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SessionTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SessionTokenTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SessionToken>(
      where: where?.call(SessionToken.t),
      orderBy: orderBy?.call(SessionToken.t),
      orderByList: orderByList?.call(SessionToken.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [SessionToken] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<SessionToken?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SessionTokenTable>? where,
    int? offset,
    _i1.OrderByBuilder<SessionTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SessionTokenTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<SessionToken>(
      where: where?.call(SessionToken.t),
      orderBy: orderBy?.call(SessionToken.t),
      orderByList: orderByList?.call(SessionToken.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [SessionToken] by its [id] or null if no such row exists.
  Future<SessionToken?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<SessionToken>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [SessionToken]s in the list and returns the inserted rows.
  ///
  /// The returned [SessionToken]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SessionToken>> insert(
    _i1.Session session,
    List<SessionToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SessionToken>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SessionToken] and returns the inserted row.
  ///
  /// The returned [SessionToken] will have its `id` field set.
  Future<SessionToken> insertRow(
    _i1.Session session,
    SessionToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SessionToken>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SessionToken]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SessionToken>> update(
    _i1.Session session,
    List<SessionToken> rows, {
    _i1.ColumnSelections<SessionTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SessionToken>(
      rows,
      columns: columns?.call(SessionToken.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SessionToken]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SessionToken> updateRow(
    _i1.Session session,
    SessionToken row, {
    _i1.ColumnSelections<SessionTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SessionToken>(
      row,
      columns: columns?.call(SessionToken.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SessionToken]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SessionToken>> delete(
    _i1.Session session,
    List<SessionToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SessionToken>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SessionToken].
  Future<SessionToken> deleteRow(
    _i1.Session session,
    SessionToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SessionToken>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SessionToken>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SessionTokenTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SessionToken>(
      where: where(SessionToken.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SessionTokenTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SessionToken>(
      where: where?.call(SessionToken.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
