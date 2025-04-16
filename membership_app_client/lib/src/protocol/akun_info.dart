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

abstract class AkunInfo implements _i1.SerializableModel {
  AkunInfo._({
    required this.id,
    required this.relatedId,
    required this.username,
    required this.email,
    required this.role,
  });

  factory AkunInfo({
    required int id,
    required int relatedId,
    required String username,
    required String email,
    required String role,
  }) = _AkunInfoImpl;

  factory AkunInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return AkunInfo(
      id: jsonSerialization['id'] as int,
      relatedId: jsonSerialization['relatedId'] as int,
      username: jsonSerialization['username'] as String,
      email: jsonSerialization['email'] as String,
      role: jsonSerialization['role'] as String,
    );
  }

  int id;

  int relatedId;

  String username;

  String email;

  String role;

  /// Returns a shallow copy of this [AkunInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AkunInfo copyWith({
    int? id,
    int? relatedId,
    String? username,
    String? email,
    String? role,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'relatedId': relatedId,
      'username': username,
      'email': email,
      'role': role,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AkunInfoImpl extends AkunInfo {
  _AkunInfoImpl({
    required int id,
    required int relatedId,
    required String username,
    required String email,
    required String role,
  }) : super._(
          id: id,
          relatedId: relatedId,
          username: username,
          email: email,
          role: role,
        );

  /// Returns a shallow copy of this [AkunInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AkunInfo copyWith({
    int? id,
    int? relatedId,
    String? username,
    String? email,
    String? role,
  }) {
    return AkunInfo(
      id: id ?? this.id,
      relatedId: relatedId ?? this.relatedId,
      username: username ?? this.username,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }
}
