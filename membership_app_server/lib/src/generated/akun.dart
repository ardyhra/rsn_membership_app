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

abstract class Akun implements _i1.TableRow, _i1.ProtocolSerialization {
  Akun._({
    this.id,
    required this.relatedId,
    required this.username,
    required this.email,
    required this.role,
    required this.password,
  });

  factory Akun({
    int? id,
    required int relatedId,
    required String username,
    required String email,
    required String role,
    required String password,
  }) = _AkunImpl;

  factory Akun.fromJson(Map<String, dynamic> jsonSerialization) {
    return Akun(
      id: jsonSerialization['id'] as int?,
      relatedId: jsonSerialization['relatedId'] as int,
      username: jsonSerialization['username'] as String,
      email: jsonSerialization['email'] as String,
      role: jsonSerialization['role'] as String,
      password: jsonSerialization['password'] as String,
    );
  }

  static final t = AkunTable();

  static const db = AkunRepository._();

  @override
  int? id;

  int relatedId;

  String username;

  String email;

  String role;

  String password;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Akun]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Akun copyWith({
    int? id,
    int? relatedId,
    String? username,
    String? email,
    String? role,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'relatedId': relatedId,
      'username': username,
      'email': email,
      'role': role,
      'password': password,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'relatedId': relatedId,
      'username': username,
      'email': email,
      'role': role,
      'password': password,
    };
  }

  static AkunInclude include() {
    return AkunInclude._();
  }

  static AkunIncludeList includeList({
    _i1.WhereExpressionBuilder<AkunTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AkunTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AkunTable>? orderByList,
    AkunInclude? include,
  }) {
    return AkunIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Akun.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Akun.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AkunImpl extends Akun {
  _AkunImpl({
    int? id,
    required int relatedId,
    required String username,
    required String email,
    required String role,
    required String password,
  }) : super._(
          id: id,
          relatedId: relatedId,
          username: username,
          email: email,
          role: role,
          password: password,
        );

  /// Returns a shallow copy of this [Akun]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Akun copyWith({
    Object? id = _Undefined,
    int? relatedId,
    String? username,
    String? email,
    String? role,
    String? password,
  }) {
    return Akun(
      id: id is int? ? id : this.id,
      relatedId: relatedId ?? this.relatedId,
      username: username ?? this.username,
      email: email ?? this.email,
      role: role ?? this.role,
      password: password ?? this.password,
    );
  }
}

class AkunTable extends _i1.Table {
  AkunTable({super.tableRelation}) : super(tableName: 'akun') {
    relatedId = _i1.ColumnInt(
      'relatedId',
      this,
    );
    username = _i1.ColumnString(
      'username',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    role = _i1.ColumnString(
      'role',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
  }

  late final _i1.ColumnInt relatedId;

  late final _i1.ColumnString username;

  late final _i1.ColumnString email;

  late final _i1.ColumnString role;

  late final _i1.ColumnString password;

  @override
  List<_i1.Column> get columns => [
        id,
        relatedId,
        username,
        email,
        role,
        password,
      ];
}

class AkunInclude extends _i1.IncludeObject {
  AkunInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Akun.t;
}

class AkunIncludeList extends _i1.IncludeList {
  AkunIncludeList._({
    _i1.WhereExpressionBuilder<AkunTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Akun.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Akun.t;
}

class AkunRepository {
  const AkunRepository._();

  /// Returns a list of [Akun]s matching the given query parameters.
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
  Future<List<Akun>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AkunTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AkunTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AkunTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Akun>(
      where: where?.call(Akun.t),
      orderBy: orderBy?.call(Akun.t),
      orderByList: orderByList?.call(Akun.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Akun] matching the given query parameters.
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
  Future<Akun?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AkunTable>? where,
    int? offset,
    _i1.OrderByBuilder<AkunTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AkunTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Akun>(
      where: where?.call(Akun.t),
      orderBy: orderBy?.call(Akun.t),
      orderByList: orderByList?.call(Akun.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Akun] by its [id] or null if no such row exists.
  Future<Akun?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Akun>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Akun]s in the list and returns the inserted rows.
  ///
  /// The returned [Akun]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Akun>> insert(
    _i1.Session session,
    List<Akun> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Akun>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Akun] and returns the inserted row.
  ///
  /// The returned [Akun] will have its `id` field set.
  Future<Akun> insertRow(
    _i1.Session session,
    Akun row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Akun>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Akun]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Akun>> update(
    _i1.Session session,
    List<Akun> rows, {
    _i1.ColumnSelections<AkunTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Akun>(
      rows,
      columns: columns?.call(Akun.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Akun]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Akun> updateRow(
    _i1.Session session,
    Akun row, {
    _i1.ColumnSelections<AkunTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Akun>(
      row,
      columns: columns?.call(Akun.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Akun]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Akun>> delete(
    _i1.Session session,
    List<Akun> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Akun>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Akun].
  Future<Akun> deleteRow(
    _i1.Session session,
    Akun row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Akun>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Akun>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AkunTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Akun>(
      where: where(Akun.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AkunTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Akun>(
      where: where?.call(Akun.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
