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
import 'member.dart' as _i2;

abstract class Sales implements _i1.TableRow, _i1.ProtocolSerialization {
  Sales._({
    this.id,
    required this.namaSales,
    required this.nik,
    this.pelanggan,
    required this.noWhatsapp,
  });

  factory Sales({
    int? id,
    required String namaSales,
    required String nik,
    List<_i2.Member>? pelanggan,
    required String noWhatsapp,
  }) = _SalesImpl;

  factory Sales.fromJson(Map<String, dynamic> jsonSerialization) {
    return Sales(
      id: jsonSerialization['id'] as int?,
      namaSales: jsonSerialization['namaSales'] as String,
      nik: jsonSerialization['nik'] as String,
      pelanggan: (jsonSerialization['pelanggan'] as List?)
          ?.map((e) => _i2.Member.fromJson((e as Map<String, dynamic>)))
          .toList(),
      noWhatsapp: jsonSerialization['noWhatsapp'] as String,
    );
  }

  static final t = SalesTable();

  static const db = SalesRepository._();

  @override
  int? id;

  String namaSales;

  String nik;

  List<_i2.Member>? pelanggan;

  String noWhatsapp;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Sales]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Sales copyWith({
    int? id,
    String? namaSales,
    String? nik,
    List<_i2.Member>? pelanggan,
    String? noWhatsapp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'namaSales': namaSales,
      'nik': nik,
      if (pelanggan != null)
        'pelanggan': pelanggan?.toJson(valueToJson: (v) => v.toJson()),
      'noWhatsapp': noWhatsapp,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'namaSales': namaSales,
      'nik': nik,
      if (pelanggan != null)
        'pelanggan':
            pelanggan?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'noWhatsapp': noWhatsapp,
    };
  }

  static SalesInclude include({_i2.MemberIncludeList? pelanggan}) {
    return SalesInclude._(pelanggan: pelanggan);
  }

  static SalesIncludeList includeList({
    _i1.WhereExpressionBuilder<SalesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesTable>? orderByList,
    SalesInclude? include,
  }) {
    return SalesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Sales.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Sales.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesImpl extends Sales {
  _SalesImpl({
    int? id,
    required String namaSales,
    required String nik,
    List<_i2.Member>? pelanggan,
    required String noWhatsapp,
  }) : super._(
          id: id,
          namaSales: namaSales,
          nik: nik,
          pelanggan: pelanggan,
          noWhatsapp: noWhatsapp,
        );

  /// Returns a shallow copy of this [Sales]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Sales copyWith({
    Object? id = _Undefined,
    String? namaSales,
    String? nik,
    Object? pelanggan = _Undefined,
    String? noWhatsapp,
  }) {
    return Sales(
      id: id is int? ? id : this.id,
      namaSales: namaSales ?? this.namaSales,
      nik: nik ?? this.nik,
      pelanggan: pelanggan is List<_i2.Member>?
          ? pelanggan
          : this.pelanggan?.map((e0) => e0.copyWith()).toList(),
      noWhatsapp: noWhatsapp ?? this.noWhatsapp,
    );
  }
}

class SalesTable extends _i1.Table {
  SalesTable({super.tableRelation}) : super(tableName: 'sales') {
    namaSales = _i1.ColumnString(
      'namaSales',
      this,
    );
    nik = _i1.ColumnString(
      'nik',
      this,
    );
    noWhatsapp = _i1.ColumnString(
      'noWhatsapp',
      this,
    );
  }

  late final _i1.ColumnString namaSales;

  late final _i1.ColumnString nik;

  _i2.MemberTable? ___pelanggan;

  _i1.ManyRelation<_i2.MemberTable>? _pelanggan;

  late final _i1.ColumnString noWhatsapp;

  _i2.MemberTable get __pelanggan {
    if (___pelanggan != null) return ___pelanggan!;
    ___pelanggan = _i1.createRelationTable(
      relationFieldName: '__pelanggan',
      field: Sales.t.id,
      foreignField: _i2.Member.t.$_salesPelangganSalesId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MemberTable(tableRelation: foreignTableRelation),
    );
    return ___pelanggan!;
  }

  _i1.ManyRelation<_i2.MemberTable> get pelanggan {
    if (_pelanggan != null) return _pelanggan!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'pelanggan',
      field: Sales.t.id,
      foreignField: _i2.Member.t.$_salesPelangganSalesId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MemberTable(tableRelation: foreignTableRelation),
    );
    _pelanggan = _i1.ManyRelation<_i2.MemberTable>(
      tableWithRelations: relationTable,
      table: _i2.MemberTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _pelanggan!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        namaSales,
        nik,
        noWhatsapp,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'pelanggan') {
      return __pelanggan;
    }
    return null;
  }
}

class SalesInclude extends _i1.IncludeObject {
  SalesInclude._({_i2.MemberIncludeList? pelanggan}) {
    _pelanggan = pelanggan;
  }

  _i2.MemberIncludeList? _pelanggan;

  @override
  Map<String, _i1.Include?> get includes => {'pelanggan': _pelanggan};

  @override
  _i1.Table get table => Sales.t;
}

class SalesIncludeList extends _i1.IncludeList {
  SalesIncludeList._({
    _i1.WhereExpressionBuilder<SalesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Sales.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Sales.t;
}

class SalesRepository {
  const SalesRepository._();

  final attach = const SalesAttachRepository._();

  final attachRow = const SalesAttachRowRepository._();

  final detach = const SalesDetachRepository._();

  final detachRow = const SalesDetachRowRepository._();

  /// Returns a list of [Sales]s matching the given query parameters.
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
  Future<List<Sales>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesTable>? orderByList,
    _i1.Transaction? transaction,
    SalesInclude? include,
  }) async {
    return session.db.find<Sales>(
      where: where?.call(Sales.t),
      orderBy: orderBy?.call(Sales.t),
      orderByList: orderByList?.call(Sales.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Sales] matching the given query parameters.
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
  Future<Sales?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesTable>? where,
    int? offset,
    _i1.OrderByBuilder<SalesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesTable>? orderByList,
    _i1.Transaction? transaction,
    SalesInclude? include,
  }) async {
    return session.db.findFirstRow<Sales>(
      where: where?.call(Sales.t),
      orderBy: orderBy?.call(Sales.t),
      orderByList: orderByList?.call(Sales.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Sales] by its [id] or null if no such row exists.
  Future<Sales?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SalesInclude? include,
  }) async {
    return session.db.findById<Sales>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Sales]s in the list and returns the inserted rows.
  ///
  /// The returned [Sales]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Sales>> insert(
    _i1.Session session,
    List<Sales> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Sales>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Sales] and returns the inserted row.
  ///
  /// The returned [Sales] will have its `id` field set.
  Future<Sales> insertRow(
    _i1.Session session,
    Sales row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Sales>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Sales]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Sales>> update(
    _i1.Session session,
    List<Sales> rows, {
    _i1.ColumnSelections<SalesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Sales>(
      rows,
      columns: columns?.call(Sales.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Sales]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Sales> updateRow(
    _i1.Session session,
    Sales row, {
    _i1.ColumnSelections<SalesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Sales>(
      row,
      columns: columns?.call(Sales.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Sales]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Sales>> delete(
    _i1.Session session,
    List<Sales> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Sales>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Sales].
  Future<Sales> deleteRow(
    _i1.Session session,
    Sales row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Sales>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Sales>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SalesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Sales>(
      where: where(Sales.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Sales>(
      where: where?.call(Sales.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SalesAttachRepository {
  const SalesAttachRepository._();

  /// Creates a relation between this [Sales] and the given [Member]s
  /// by setting each [Member]'s foreign key `_salesPelangganSalesId` to refer to this [Sales].
  Future<void> pelanggan(
    _i1.Session session,
    Sales sales,
    List<_i2.Member> member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.any((e) => e.id == null)) {
      throw ArgumentError.notNull('member.id');
    }
    if (sales.id == null) {
      throw ArgumentError.notNull('sales.id');
    }

    var $member = member
        .map((e) => _i2.MemberImplicit(
              e,
              $_salesPelangganSalesId: sales.id,
            ))
        .toList();
    await session.db.update<_i2.Member>(
      $member,
      columns: [_i2.Member.t.$_salesPelangganSalesId],
      transaction: transaction,
    );
  }
}

class SalesAttachRowRepository {
  const SalesAttachRowRepository._();

  /// Creates a relation between this [Sales] and the given [Member]
  /// by setting the [Member]'s foreign key `_salesPelangganSalesId` to refer to this [Sales].
  Future<void> pelanggan(
    _i1.Session session,
    Sales sales,
    _i2.Member member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }
    if (sales.id == null) {
      throw ArgumentError.notNull('sales.id');
    }

    var $member = _i2.MemberImplicit(
      member,
      $_salesPelangganSalesId: sales.id,
    );
    await session.db.updateRow<_i2.Member>(
      $member,
      columns: [_i2.Member.t.$_salesPelangganSalesId],
      transaction: transaction,
    );
  }
}

class SalesDetachRepository {
  const SalesDetachRepository._();

  /// Detaches the relation between this [Sales] and the given [Member]
  /// by setting the [Member]'s foreign key `_salesPelangganSalesId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pelanggan(
    _i1.Session session,
    List<_i2.Member> member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.any((e) => e.id == null)) {
      throw ArgumentError.notNull('member.id');
    }

    var $member = member
        .map((e) => _i2.MemberImplicit(
              e,
              $_salesPelangganSalesId: null,
            ))
        .toList();
    await session.db.update<_i2.Member>(
      $member,
      columns: [_i2.Member.t.$_salesPelangganSalesId],
      transaction: transaction,
    );
  }
}

class SalesDetachRowRepository {
  const SalesDetachRowRepository._();

  /// Detaches the relation between this [Sales] and the given [Member]
  /// by setting the [Member]'s foreign key `_salesPelangganSalesId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pelanggan(
    _i1.Session session,
    _i2.Member member, {
    _i1.Transaction? transaction,
  }) async {
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $member = _i2.MemberImplicit(
      member,
      $_salesPelangganSalesId: null,
    );
    await session.db.updateRow<_i2.Member>(
      $member,
      columns: [_i2.Member.t.$_salesPelangganSalesId],
      transaction: transaction,
    );
  }
}
