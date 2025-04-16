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

abstract class Admin implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String namaAdmin;

  String nip;

  bool superAdmin;

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
