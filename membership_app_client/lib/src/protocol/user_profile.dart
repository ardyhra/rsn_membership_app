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
import 'akun_info.dart' as _i2;
import 'admin.dart' as _i3;

abstract class UserProfile implements _i1.SerializableModel {
  UserProfile._({
    this.akunInfo,
    this.adminProfile,
  });

  factory UserProfile({
    _i2.AkunInfo? akunInfo,
    _i3.Admin? adminProfile,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfile(
      akunInfo: jsonSerialization['akunInfo'] == null
          ? null
          : _i2.AkunInfo.fromJson(
              (jsonSerialization['akunInfo'] as Map<String, dynamic>)),
      adminProfile: jsonSerialization['adminProfile'] == null
          ? null
          : _i3.Admin.fromJson(
              (jsonSerialization['adminProfile'] as Map<String, dynamic>)),
    );
  }

  _i2.AkunInfo? akunInfo;

  _i3.Admin? adminProfile;

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserProfile copyWith({
    _i2.AkunInfo? akunInfo,
    _i3.Admin? adminProfile,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (akunInfo != null) 'akunInfo': akunInfo?.toJson(),
      if (adminProfile != null) 'adminProfile': adminProfile?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    _i2.AkunInfo? akunInfo,
    _i3.Admin? adminProfile,
  }) : super._(
          akunInfo: akunInfo,
          adminProfile: adminProfile,
        );

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserProfile copyWith({
    Object? akunInfo = _Undefined,
    Object? adminProfile = _Undefined,
  }) {
    return UserProfile(
      akunInfo:
          akunInfo is _i2.AkunInfo? ? akunInfo : this.akunInfo?.copyWith(),
      adminProfile: adminProfile is _i3.Admin?
          ? adminProfile
          : this.adminProfile?.copyWith(),
    );
  }
}
