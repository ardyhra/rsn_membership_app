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

abstract class Member implements _i1.SerializableModel {
  Member._({
    this.id,
    required this.namaPelanggan,
    required this.noWhatsapp,
    required this.nik,
    required this.alamatKtp,
    required this.kelurahan,
    required this.kecamatan,
    required this.kabupaten,
    required this.provinsi,
    required this.status,
    this.ktp,
    required this.tanggalDibuat,
  });

  factory Member({
    int? id,
    required String namaPelanggan,
    required String noWhatsapp,
    required int nik,
    required String alamatKtp,
    required String kelurahan,
    required String kecamatan,
    required String kabupaten,
    required String provinsi,
    required String status,
    String? ktp,
    required DateTime tanggalDibuat,
  }) = _MemberImpl;

  factory Member.fromJson(Map<String, dynamic> jsonSerialization) {
    return Member(
      id: jsonSerialization['id'] as int?,
      namaPelanggan: jsonSerialization['namaPelanggan'] as String,
      noWhatsapp: jsonSerialization['noWhatsapp'] as String,
      nik: jsonSerialization['nik'] as int,
      alamatKtp: jsonSerialization['alamatKtp'] as String,
      kelurahan: jsonSerialization['kelurahan'] as String,
      kecamatan: jsonSerialization['kecamatan'] as String,
      kabupaten: jsonSerialization['kabupaten'] as String,
      provinsi: jsonSerialization['provinsi'] as String,
      status: jsonSerialization['status'] as String,
      ktp: jsonSerialization['ktp'] as String?,
      tanggalDibuat: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['tanggalDibuat']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String namaPelanggan;

  String noWhatsapp;

  int nik;

  String alamatKtp;

  String kelurahan;

  String kecamatan;

  String kabupaten;

  String provinsi;

  String status;

  String? ktp;

  DateTime tanggalDibuat;

  Member copyWith({
    int? id,
    String? namaPelanggan,
    String? noWhatsapp,
    int? nik,
    String? alamatKtp,
    String? kelurahan,
    String? kecamatan,
    String? kabupaten,
    String? provinsi,
    String? status,
    String? ktp,
    DateTime? tanggalDibuat,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'namaPelanggan': namaPelanggan,
      'noWhatsapp': noWhatsapp,
      'nik': nik,
      'alamatKtp': alamatKtp,
      'kelurahan': kelurahan,
      'kecamatan': kecamatan,
      'kabupaten': kabupaten,
      'provinsi': provinsi,
      'status': status,
      if (ktp != null) 'ktp': ktp,
      'tanggalDibuat': tanggalDibuat.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MemberImpl extends Member {
  _MemberImpl({
    int? id,
    required String namaPelanggan,
    required String noWhatsapp,
    required int nik,
    required String alamatKtp,
    required String kelurahan,
    required String kecamatan,
    required String kabupaten,
    required String provinsi,
    required String status,
    String? ktp,
    required DateTime tanggalDibuat,
  }) : super._(
          id: id,
          namaPelanggan: namaPelanggan,
          noWhatsapp: noWhatsapp,
          nik: nik,
          alamatKtp: alamatKtp,
          kelurahan: kelurahan,
          kecamatan: kecamatan,
          kabupaten: kabupaten,
          provinsi: provinsi,
          status: status,
          ktp: ktp,
          tanggalDibuat: tanggalDibuat,
        );

  @override
  Member copyWith({
    Object? id = _Undefined,
    String? namaPelanggan,
    String? noWhatsapp,
    int? nik,
    String? alamatKtp,
    String? kelurahan,
    String? kecamatan,
    String? kabupaten,
    String? provinsi,
    String? status,
    Object? ktp = _Undefined,
    DateTime? tanggalDibuat,
  }) {
    return Member(
      id: id is int? ? id : this.id,
      namaPelanggan: namaPelanggan ?? this.namaPelanggan,
      noWhatsapp: noWhatsapp ?? this.noWhatsapp,
      nik: nik ?? this.nik,
      alamatKtp: alamatKtp ?? this.alamatKtp,
      kelurahan: kelurahan ?? this.kelurahan,
      kecamatan: kecamatan ?? this.kecamatan,
      kabupaten: kabupaten ?? this.kabupaten,
      provinsi: provinsi ?? this.provinsi,
      status: status ?? this.status,
      ktp: ktp is String? ? ktp : this.ktp,
      tanggalDibuat: tanggalDibuat ?? this.tanggalDibuat,
    );
  }
}
