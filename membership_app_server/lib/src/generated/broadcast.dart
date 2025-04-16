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

abstract class Broadcast implements _i1.TableRow, _i1.ProtocolSerialization {
  Broadcast._({
    this.id,
    required this.pesan,
    required this.tujuan,
    required this.tanggalDibuat,
  });

  factory Broadcast({
    int? id,
    required String pesan,
    required int tujuan,
    required DateTime tanggalDibuat,
  }) = _BroadcastImpl;

  factory Broadcast.fromJson(Map<String, dynamic> jsonSerialization) {
    return Broadcast(
      id: jsonSerialization['id'] as int?,
      pesan: jsonSerialization['pesan'] as String,
      tujuan: jsonSerialization['tujuan'] as int,
      tanggalDibuat: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['tanggalDibuat']),
    );
  }

  static final t = BroadcastTable();

  static const db = BroadcastRepository._();

  @override
  int? id;

  String pesan;

  int tujuan;

  DateTime tanggalDibuat;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Broadcast]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Broadcast copyWith({
    int? id,
    String? pesan,
    int? tujuan,
    DateTime? tanggalDibuat,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'pesan': pesan,
      'tujuan': tujuan,
      'tanggalDibuat': tanggalDibuat.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'pesan': pesan,
      'tujuan': tujuan,
      'tanggalDibuat': tanggalDibuat.toJson(),
    };
  }

  static BroadcastInclude include() {
    return BroadcastInclude._();
  }

  static BroadcastIncludeList includeList({
    _i1.WhereExpressionBuilder<BroadcastTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BroadcastTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BroadcastTable>? orderByList,
    BroadcastInclude? include,
  }) {
    return BroadcastIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Broadcast.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Broadcast.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BroadcastImpl extends Broadcast {
  _BroadcastImpl({
    int? id,
    required String pesan,
    required int tujuan,
    required DateTime tanggalDibuat,
  }) : super._(
          id: id,
          pesan: pesan,
          tujuan: tujuan,
          tanggalDibuat: tanggalDibuat,
        );

  /// Returns a shallow copy of this [Broadcast]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Broadcast copyWith({
    Object? id = _Undefined,
    String? pesan,
    int? tujuan,
    DateTime? tanggalDibuat,
  }) {
    return Broadcast(
      id: id is int? ? id : this.id,
      pesan: pesan ?? this.pesan,
      tujuan: tujuan ?? this.tujuan,
      tanggalDibuat: tanggalDibuat ?? this.tanggalDibuat,
    );
  }
}

class BroadcastTable extends _i1.Table {
  BroadcastTable({super.tableRelation}) : super(tableName: 'broadcast') {
    pesan = _i1.ColumnString(
      'pesan',
      this,
    );
    tujuan = _i1.ColumnInt(
      'tujuan',
      this,
    );
    tanggalDibuat = _i1.ColumnDateTime(
      'tanggalDibuat',
      this,
    );
  }

  late final _i1.ColumnString pesan;

  late final _i1.ColumnInt tujuan;

  late final _i1.ColumnDateTime tanggalDibuat;

  @override
  List<_i1.Column> get columns => [
        id,
        pesan,
        tujuan,
        tanggalDibuat,
      ];
}

class BroadcastInclude extends _i1.IncludeObject {
  BroadcastInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Broadcast.t;
}

class BroadcastIncludeList extends _i1.IncludeList {
  BroadcastIncludeList._({
    _i1.WhereExpressionBuilder<BroadcastTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Broadcast.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Broadcast.t;
}

class BroadcastRepository {
  const BroadcastRepository._();

  /// Returns a list of [Broadcast]s matching the given query parameters.
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
  Future<List<Broadcast>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BroadcastTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BroadcastTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BroadcastTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Broadcast>(
      where: where?.call(Broadcast.t),
      orderBy: orderBy?.call(Broadcast.t),
      orderByList: orderByList?.call(Broadcast.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Broadcast] matching the given query parameters.
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
  Future<Broadcast?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BroadcastTable>? where,
    int? offset,
    _i1.OrderByBuilder<BroadcastTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BroadcastTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Broadcast>(
      where: where?.call(Broadcast.t),
      orderBy: orderBy?.call(Broadcast.t),
      orderByList: orderByList?.call(Broadcast.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Broadcast] by its [id] or null if no such row exists.
  Future<Broadcast?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Broadcast>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Broadcast]s in the list and returns the inserted rows.
  ///
  /// The returned [Broadcast]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Broadcast>> insert(
    _i1.Session session,
    List<Broadcast> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Broadcast>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Broadcast] and returns the inserted row.
  ///
  /// The returned [Broadcast] will have its `id` field set.
  Future<Broadcast> insertRow(
    _i1.Session session,
    Broadcast row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Broadcast>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Broadcast]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Broadcast>> update(
    _i1.Session session,
    List<Broadcast> rows, {
    _i1.ColumnSelections<BroadcastTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Broadcast>(
      rows,
      columns: columns?.call(Broadcast.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Broadcast]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Broadcast> updateRow(
    _i1.Session session,
    Broadcast row, {
    _i1.ColumnSelections<BroadcastTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Broadcast>(
      row,
      columns: columns?.call(Broadcast.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Broadcast]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Broadcast>> delete(
    _i1.Session session,
    List<Broadcast> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Broadcast>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Broadcast].
  Future<Broadcast> deleteRow(
    _i1.Session session,
    Broadcast row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Broadcast>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Broadcast>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BroadcastTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Broadcast>(
      where: where(Broadcast.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BroadcastTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Broadcast>(
      where: where?.call(Broadcast.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
