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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'admin.dart' as _i4;
import 'akun.dart' as _i5;
import 'akun_info.dart' as _i6;
import 'auth_response.dart' as _i7;
import 'broadcast.dart' as _i8;
import 'database_member.dart' as _i9;
import 'example.dart' as _i10;
import 'informasi.dart' as _i11;
import 'member.dart' as _i12;
import 'sales.dart' as _i13;
import 'session_token.dart' as _i14;
import 'user_profile.dart' as _i15;
import 'package:membership_app_server/src/generated/admin.dart' as _i16;
import 'package:membership_app_server/src/generated/akun.dart' as _i17;
import 'package:membership_app_server/src/generated/broadcast.dart' as _i18;
import 'package:membership_app_server/src/generated/database_member.dart'
    as _i19;
import 'package:membership_app_server/src/generated/informasi.dart' as _i20;
import 'package:membership_app_server/src/generated/member.dart' as _i21;
import 'package:membership_app_server/src/generated/sales.dart' as _i22;
export 'admin.dart';
export 'akun.dart';
export 'akun_info.dart';
export 'auth_response.dart';
export 'broadcast.dart';
export 'database_member.dart';
export 'example.dart';
export 'informasi.dart';
export 'member.dart';
export 'sales.dart';
export 'session_token.dart';
export 'user_profile.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'admin',
      dartName: 'Admin',
      schema: 'public',
      module: 'membership_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'admin_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'namaAdmin',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'nip',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'superAdmin',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'admin_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'akun',
      dartName: 'Akun',
      schema: 'public',
      module: 'membership_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'akun_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'relatedId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'username',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'akun_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'broadcast',
      dartName: 'Broadcast',
      schema: 'public',
      module: 'membership_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'broadcast_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'pesan',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tujuan',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'tanggalDibuat',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'broadcast_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'database_member',
      dartName: 'DatabaseMember',
      schema: 'public',
      module: 'membership_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'database_member_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'buktiPembayaran',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'keterangan',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'pelangganId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'database_member_fk_0',
          columns: ['pelangganId'],
          referenceTable: 'member',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'database_member_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'informasi',
      dartName: 'Informasi',
      schema: 'public',
      module: 'membership_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'informasi_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tujuan',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tanggalDibuat',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'judul',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'deskripsi',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'informasi_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'member',
      dartName: 'Member',
      schema: 'public',
      module: 'membership_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'member_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'namaPelanggan',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'noWhatsapp',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'nik',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'alamatKtp',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'kelurahan',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'kecamatan',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'kabupaten',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'provinsi',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'ktp',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'tanggalDibuat',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'alamatDomisili',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'kelurahanDomisili',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'kecamatanDomisili',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'kabupatenDomisili',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'provinsiDomisili',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'salesPelangganSalesId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: '_salesPelangganSalesId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'member_fk_0',
          columns: ['salesPelangganSalesId'],
          referenceTable: 'sales',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'member_fk_1',
          columns: ['_salesPelangganSalesId'],
          referenceTable: 'sales',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'member_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'nik_pelanggan_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'nik',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'sales',
      dartName: 'Sales',
      schema: 'public',
      module: 'membership_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'sales_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'namaSales',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'nik',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'noWhatsapp',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'sales_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'nik_sales_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'nik',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'session_token',
      dartName: 'SessionToken',
      schema: 'public',
      module: 'membership_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'session_token_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tokenHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'session_token_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'session_token_token_hash_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tokenHash',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'session_token_user_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'session_token_expires_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'expiresAt',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Admin) {
      return _i4.Admin.fromJson(data) as T;
    }
    if (t == _i5.Akun) {
      return _i5.Akun.fromJson(data) as T;
    }
    if (t == _i6.AkunInfo) {
      return _i6.AkunInfo.fromJson(data) as T;
    }
    if (t == _i7.AuthResponse) {
      return _i7.AuthResponse.fromJson(data) as T;
    }
    if (t == _i8.Broadcast) {
      return _i8.Broadcast.fromJson(data) as T;
    }
    if (t == _i9.DatabaseMember) {
      return _i9.DatabaseMember.fromJson(data) as T;
    }
    if (t == _i10.Example) {
      return _i10.Example.fromJson(data) as T;
    }
    if (t == _i11.Informasi) {
      return _i11.Informasi.fromJson(data) as T;
    }
    if (t == _i12.Member) {
      return _i12.Member.fromJson(data) as T;
    }
    if (t == _i13.Sales) {
      return _i13.Sales.fromJson(data) as T;
    }
    if (t == _i14.SessionToken) {
      return _i14.SessionToken.fromJson(data) as T;
    }
    if (t == _i15.UserProfile) {
      return _i15.UserProfile.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Admin?>()) {
      return (data != null ? _i4.Admin.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Akun?>()) {
      return (data != null ? _i5.Akun.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AkunInfo?>()) {
      return (data != null ? _i6.AkunInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AuthResponse?>()) {
      return (data != null ? _i7.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Broadcast?>()) {
      return (data != null ? _i8.Broadcast.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DatabaseMember?>()) {
      return (data != null ? _i9.DatabaseMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Example?>()) {
      return (data != null ? _i10.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Informasi?>()) {
      return (data != null ? _i11.Informasi.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Member?>()) {
      return (data != null ? _i12.Member.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Sales?>()) {
      return (data != null ? _i13.Sales.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.SessionToken?>()) {
      return (data != null ? _i14.SessionToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.UserProfile?>()) {
      return (data != null ? _i15.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i12.Member>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Member>(e)).toList()
          : null) as T;
    }
    if (t == List<_i16.Admin>) {
      return (data as List).map((e) => deserialize<_i16.Admin>(e)).toList()
          as T;
    }
    if (t == List<_i17.Akun>) {
      return (data as List).map((e) => deserialize<_i17.Akun>(e)).toList() as T;
    }
    if (t == List<_i18.Broadcast>) {
      return (data as List).map((e) => deserialize<_i18.Broadcast>(e)).toList()
          as T;
    }
    if (t == Map<String, int>) {
      return (data as Map).map(
          (k, v) => MapEntry(deserialize<String>(k), deserialize<int>(v))) as T;
    }
    if (t == List<_i19.DatabaseMember>) {
      return (data as List)
          .map((e) => deserialize<_i19.DatabaseMember>(e))
          .toList() as T;
    }
    if (t == List<_i20.Informasi>) {
      return (data as List).map((e) => deserialize<_i20.Informasi>(e)).toList()
          as T;
    }
    if (t == List<_i21.Member>) {
      return (data as List).map((e) => deserialize<_i21.Member>(e)).toList()
          as T;
    }
    if (t == List<_i22.Sales>) {
      return (data as List).map((e) => deserialize<_i22.Sales>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.Admin) {
      return 'Admin';
    }
    if (data is _i5.Akun) {
      return 'Akun';
    }
    if (data is _i6.AkunInfo) {
      return 'AkunInfo';
    }
    if (data is _i7.AuthResponse) {
      return 'AuthResponse';
    }
    if (data is _i8.Broadcast) {
      return 'Broadcast';
    }
    if (data is _i9.DatabaseMember) {
      return 'DatabaseMember';
    }
    if (data is _i10.Example) {
      return 'Example';
    }
    if (data is _i11.Informasi) {
      return 'Informasi';
    }
    if (data is _i12.Member) {
      return 'Member';
    }
    if (data is _i13.Sales) {
      return 'Sales';
    }
    if (data is _i14.SessionToken) {
      return 'SessionToken';
    }
    if (data is _i15.UserProfile) {
      return 'UserProfile';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Admin') {
      return deserialize<_i4.Admin>(data['data']);
    }
    if (dataClassName == 'Akun') {
      return deserialize<_i5.Akun>(data['data']);
    }
    if (dataClassName == 'AkunInfo') {
      return deserialize<_i6.AkunInfo>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i7.AuthResponse>(data['data']);
    }
    if (dataClassName == 'Broadcast') {
      return deserialize<_i8.Broadcast>(data['data']);
    }
    if (dataClassName == 'DatabaseMember') {
      return deserialize<_i9.DatabaseMember>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i10.Example>(data['data']);
    }
    if (dataClassName == 'Informasi') {
      return deserialize<_i11.Informasi>(data['data']);
    }
    if (dataClassName == 'Member') {
      return deserialize<_i12.Member>(data['data']);
    }
    if (dataClassName == 'Sales') {
      return deserialize<_i13.Sales>(data['data']);
    }
    if (dataClassName == 'SessionToken') {
      return deserialize<_i14.SessionToken>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i15.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Admin:
        return _i4.Admin.t;
      case _i5.Akun:
        return _i5.Akun.t;
      case _i8.Broadcast:
        return _i8.Broadcast.t;
      case _i9.DatabaseMember:
        return _i9.DatabaseMember.t;
      case _i11.Informasi:
        return _i11.Informasi.t;
      case _i12.Member:
        return _i12.Member.t;
      case _i13.Sales:
        return _i13.Sales.t;
      case _i14.SessionToken:
        return _i14.SessionToken.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'membership_app';
}
