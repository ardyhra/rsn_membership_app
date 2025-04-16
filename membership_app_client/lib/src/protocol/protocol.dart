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
import 'admin.dart' as _i2;
import 'akun.dart' as _i3;
import 'akun_info.dart' as _i4;
import 'auth_response.dart' as _i5;
import 'broadcast.dart' as _i6;
import 'database_member.dart' as _i7;
import 'example.dart' as _i8;
import 'informasi.dart' as _i9;
import 'member.dart' as _i10;
import 'sales.dart' as _i11;
import 'session_token.dart' as _i12;
import 'user_profile.dart' as _i13;
import 'package:membership_app_client/src/protocol/admin.dart' as _i14;
import 'package:membership_app_client/src/protocol/akun.dart' as _i15;
import 'package:membership_app_client/src/protocol/broadcast.dart' as _i16;
import 'package:membership_app_client/src/protocol/database_member.dart'
    as _i17;
import 'package:membership_app_client/src/protocol/informasi.dart' as _i18;
import 'package:membership_app_client/src/protocol/member.dart' as _i19;
import 'package:membership_app_client/src/protocol/sales.dart' as _i20;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i21;
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
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Admin) {
      return _i2.Admin.fromJson(data) as T;
    }
    if (t == _i3.Akun) {
      return _i3.Akun.fromJson(data) as T;
    }
    if (t == _i4.AkunInfo) {
      return _i4.AkunInfo.fromJson(data) as T;
    }
    if (t == _i5.AuthResponse) {
      return _i5.AuthResponse.fromJson(data) as T;
    }
    if (t == _i6.Broadcast) {
      return _i6.Broadcast.fromJson(data) as T;
    }
    if (t == _i7.DatabaseMember) {
      return _i7.DatabaseMember.fromJson(data) as T;
    }
    if (t == _i8.Example) {
      return _i8.Example.fromJson(data) as T;
    }
    if (t == _i9.Informasi) {
      return _i9.Informasi.fromJson(data) as T;
    }
    if (t == _i10.Member) {
      return _i10.Member.fromJson(data) as T;
    }
    if (t == _i11.Sales) {
      return _i11.Sales.fromJson(data) as T;
    }
    if (t == _i12.SessionToken) {
      return _i12.SessionToken.fromJson(data) as T;
    }
    if (t == _i13.UserProfile) {
      return _i13.UserProfile.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Admin?>()) {
      return (data != null ? _i2.Admin.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Akun?>()) {
      return (data != null ? _i3.Akun.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AkunInfo?>()) {
      return (data != null ? _i4.AkunInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AuthResponse?>()) {
      return (data != null ? _i5.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Broadcast?>()) {
      return (data != null ? _i6.Broadcast.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DatabaseMember?>()) {
      return (data != null ? _i7.DatabaseMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Example?>()) {
      return (data != null ? _i8.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Informasi?>()) {
      return (data != null ? _i9.Informasi.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Member?>()) {
      return (data != null ? _i10.Member.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Sales?>()) {
      return (data != null ? _i11.Sales.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.SessionToken?>()) {
      return (data != null ? _i12.SessionToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.UserProfile?>()) {
      return (data != null ? _i13.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i10.Member>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i10.Member>(e)).toList()
          : null) as T;
    }
    if (t == List<_i14.Admin>) {
      return (data as List).map((e) => deserialize<_i14.Admin>(e)).toList()
          as T;
    }
    if (t == List<_i15.Akun>) {
      return (data as List).map((e) => deserialize<_i15.Akun>(e)).toList() as T;
    }
    if (t == List<_i16.Broadcast>) {
      return (data as List).map((e) => deserialize<_i16.Broadcast>(e)).toList()
          as T;
    }
    if (t == Map<String, int>) {
      return (data as Map).map(
          (k, v) => MapEntry(deserialize<String>(k), deserialize<int>(v))) as T;
    }
    if (t == List<_i17.DatabaseMember>) {
      return (data as List)
          .map((e) => deserialize<_i17.DatabaseMember>(e))
          .toList() as T;
    }
    if (t == List<_i18.Informasi>) {
      return (data as List).map((e) => deserialize<_i18.Informasi>(e)).toList()
          as T;
    }
    if (t == List<_i19.Member>) {
      return (data as List).map((e) => deserialize<_i19.Member>(e)).toList()
          as T;
    }
    if (t == List<_i20.Sales>) {
      return (data as List).map((e) => deserialize<_i20.Sales>(e)).toList()
          as T;
    }
    try {
      return _i21.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Admin) {
      return 'Admin';
    }
    if (data is _i3.Akun) {
      return 'Akun';
    }
    if (data is _i4.AkunInfo) {
      return 'AkunInfo';
    }
    if (data is _i5.AuthResponse) {
      return 'AuthResponse';
    }
    if (data is _i6.Broadcast) {
      return 'Broadcast';
    }
    if (data is _i7.DatabaseMember) {
      return 'DatabaseMember';
    }
    if (data is _i8.Example) {
      return 'Example';
    }
    if (data is _i9.Informasi) {
      return 'Informasi';
    }
    if (data is _i10.Member) {
      return 'Member';
    }
    if (data is _i11.Sales) {
      return 'Sales';
    }
    if (data is _i12.SessionToken) {
      return 'SessionToken';
    }
    if (data is _i13.UserProfile) {
      return 'UserProfile';
    }
    className = _i21.Protocol().getClassNameForObject(data);
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
      return deserialize<_i2.Admin>(data['data']);
    }
    if (dataClassName == 'Akun') {
      return deserialize<_i3.Akun>(data['data']);
    }
    if (dataClassName == 'AkunInfo') {
      return deserialize<_i4.AkunInfo>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i5.AuthResponse>(data['data']);
    }
    if (dataClassName == 'Broadcast') {
      return deserialize<_i6.Broadcast>(data['data']);
    }
    if (dataClassName == 'DatabaseMember') {
      return deserialize<_i7.DatabaseMember>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i8.Example>(data['data']);
    }
    if (dataClassName == 'Informasi') {
      return deserialize<_i9.Informasi>(data['data']);
    }
    if (dataClassName == 'Member') {
      return deserialize<_i10.Member>(data['data']);
    }
    if (dataClassName == 'Sales') {
      return deserialize<_i11.Sales>(data['data']);
    }
    if (dataClassName == 'SessionToken') {
      return deserialize<_i12.SessionToken>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i13.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i21.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
