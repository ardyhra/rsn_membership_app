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

abstract class Admin implements _i1.TableRow, _i1.ProtocolSerialization {
  Admin._({
    this.id,
    required this.namaAdmin,
    required this.nip,
    required this.superAdmin,
  });

  factory Admin({
    int? id,
    required String namaAdmin,
    required String nip,
    required bool superAdmin,
  }) = _AdminImpl;

  factory Admin.fromJson(Map<String, dynamic> jsonSerialization) {
    return Admin(
      id: jsonSerialization['id'] as int?,
      namaAdmin: jsonSerialization['namaAdmin'] as String,
      nip: jsonSerialization['nip'] as String,
      superAdmin: jsonSerialization['superAdmin'] as bool,
    );
  }

  static final t = AdminTable();

  static const db = AdminRepository._();

  @override
  int? id;

  String namaAdmin;

  String nip;

  bool superAdmin;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Admin]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Admin copyWith({
    int? id,
    String? namaAdmin,
    String? nip,
    bool? superAdmin,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'namaAdmin': namaAdmin,
      'nip': nip,
      'superAdmin': superAdmin,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'namaAdmin': namaAdmin,
      'nip': nip,
      'superAdmin': superAdmin,
    };
  }

  static AdminInclude include() {
    return AdminInclude._();
  }

  static AdminIncludeList includeList({
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AdminTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AdminTable>? orderByList,
    AdminInclude? include,
  }) {
    return AdminIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Admin.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Admin.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AdminImpl extends Admin {
  _AdminImpl({
    int? id,
    required String namaAdmin,
    required String nip,
    required bool superAdmin,
  }) : super._(
          id: id,
          namaAdmin: namaAdmin,
          nip: nip,
          superAdmin: superAdmin,
        );

  /// Returns a shallow copy of this [Admin]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Admin copyWith({
    Object? id = _Undefined,
    String? namaAdmin,
    String? nip,
    bool? superAdmin,
  }) {
    return Admin(
      id: id is int? ? id : this.id,
      namaAdmin: namaAdmin ?? this.namaAdmin,
      nip: nip ?? this.nip,
      superAdmin: superAdmin ?? this.superAdmin,
    );
  }
}

class AdminTable extends _i1.Table {
  AdminTable({super.tableRelation}) : super(tableName: 'admin') {
    namaAdmin = _i1.ColumnString(
      'namaAdmin',
      this,
    );
    nip = _i1.ColumnString(
      'nip',
      this,
    );
    superAdmin = _i1.ColumnBool(
      'superAdmin',
      this,
    );
  }

  late final _i1.ColumnString namaAdmin;

  late final _i1.ColumnString nip;

  late final _i1.ColumnBool superAdmin;

  @override
  List<_i1.Column> get columns => [
        id,
        namaAdmin,
        nip,
        superAdmin,
      ];
}

class AdminInclude extends _i1.IncludeObject {
  AdminInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Admin.t;
}

class AdminIncludeList extends _i1.IncludeList {
  AdminIncludeList._({
    _i1.WhereExpressionBuilder<AdminTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Admin.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Admin.t;
}

class AdminRepository {
  const AdminRepository._();

  /// Returns a list of [Admin]s matching the given query parameters.
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
  Future<List<Admin>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AdminTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AdminTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Admin>(
      where: where?.call(Admin.t),
      orderBy: orderBy?.call(Admin.t),
      orderByList: orderByList?.call(Admin.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Admin] matching the given query parameters.
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
  Future<Admin?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? offset,
    _i1.OrderByBuilder<AdminTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AdminTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Admin>(
      where: where?.call(Admin.t),
      orderBy: orderBy?.call(Admin.t),
      orderByList: orderByList?.call(Admin.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Admin] by its [id] or null if no such row exists.
  Future<Admin?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Admin>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Admin]s in the list and returns the inserted rows.
  ///
  /// The returned [Admin]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Admin>> insert(
    _i1.Session session,
    List<Admin> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Admin>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Admin] and returns the inserted row.
  ///
  /// The returned [Admin] will have its `id` field set.
  Future<Admin> insertRow(
    _i1.Session session,
    Admin row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Admin>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Admin]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Admin>> update(
    _i1.Session session,
    List<Admin> rows, {
    _i1.ColumnSelections<AdminTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Admin>(
      rows,
      columns: columns?.call(Admin.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Admin]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Admin> updateRow(
    _i1.Session session,
    Admin row, {
    _i1.ColumnSelections<AdminTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Admin>(
      row,
      columns: columns?.call(Admin.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Admin]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Admin>> delete(
    _i1.Session session,
    List<Admin> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Admin>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Admin].
  Future<Admin> deleteRow(
    _i1.Session session,
    Admin row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Admin>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Admin>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AdminTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Admin>(
      where: where(Admin.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AdminTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Admin>(
      where: where?.call(Admin.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
