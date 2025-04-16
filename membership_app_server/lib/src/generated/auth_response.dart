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
import 'akun_info.dart' as _i2;

abstract class AuthResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AuthResponse._({
    required this.success,
    this.akunInfo,
    this.key,
    this.message,
  });

  factory AuthResponse({
    required bool success,
    _i2.AkunInfo? akunInfo,
    String? key,
    String? message,
  }) = _AuthResponseImpl;

  factory AuthResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthResponse(
      success: jsonSerialization['success'] as bool,
      akunInfo: jsonSerialization['akunInfo'] == null
          ? null
          : _i2.AkunInfo.fromJson(
              (jsonSerialization['akunInfo'] as Map<String, dynamic>)),
      key: jsonSerialization['key'] as String?,
      message: jsonSerialization['message'] as String?,
    );
  }

  bool success;

  _i2.AkunInfo? akunInfo;

  String? key;

  String? message;

  /// Returns a shallow copy of this [AuthResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthResponse copyWith({
    bool? success,
    _i2.AkunInfo? akunInfo,
    String? key,
    String? message,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      if (akunInfo != null) 'akunInfo': akunInfo?.toJson(),
      if (key != null) 'key': key,
      if (message != null) 'message': message,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'success': success,
      if (akunInfo != null) 'akunInfo': akunInfo?.toJsonForProtocol(),
      if (key != null) 'key': key,
      if (message != null) 'message': message,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthResponseImpl extends AuthResponse {
  _AuthResponseImpl({
    required bool success,
    _i2.AkunInfo? akunInfo,
    String? key,
    String? message,
  }) : super._(
          success: success,
          akunInfo: akunInfo,
          key: key,
          message: message,
        );

  /// Returns a shallow copy of this [AuthResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthResponse copyWith({
    bool? success,
    Object? akunInfo = _Undefined,
    Object? key = _Undefined,
    Object? message = _Undefined,
  }) {
    return AuthResponse(
      success: success ?? this.success,
      akunInfo:
          akunInfo is _i2.AkunInfo? ? akunInfo : this.akunInfo?.copyWith(),
      key: key is String? ? key : this.key,
      message: message is String? ? message : this.message,
    );
  }
}
