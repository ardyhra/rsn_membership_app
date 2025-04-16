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
import 'dart:async' as _i2;
import 'package:membership_app_client/src/protocol/admin.dart' as _i3;
import 'package:membership_app_client/src/protocol/akun.dart' as _i4;
import 'package:membership_app_client/src/protocol/auth_response.dart' as _i5;
import 'package:membership_app_client/src/protocol/user_profile.dart' as _i6;
import 'package:membership_app_client/src/protocol/broadcast.dart' as _i7;
import 'package:membership_app_client/src/protocol/database_member.dart' as _i8;
import 'package:membership_app_client/src/protocol/informasi.dart' as _i9;
import 'package:membership_app_client/src/protocol/member.dart' as _i10;
import 'package:membership_app_client/src/protocol/sales.dart' as _i11;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i12;
import 'protocol.dart' as _i13;

/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  _i2.Future<_i3.Admin?> addAdmin(
    _i3.Admin admin, {
    String? bearerToken,
  }) =>
      caller.callServerEndpoint<_i3.Admin?>(
        'admin',
        'addAdmin',
        {
          'admin': admin,
          'bearerToken': bearerToken,
        },
      );

  _i2.Future<List<_i3.Admin>> getAllAdmins({String? bearerToken}) =>
      caller.callServerEndpoint<List<_i3.Admin>>(
        'admin',
        'getAllAdmins',
        {'bearerToken': bearerToken},
      );

  _i2.Future<_i3.Admin?> getAdminById(
    int adminId, {
    String? bearerToken,
  }) =>
      caller.callServerEndpoint<_i3.Admin?>(
        'admin',
        'getAdminById',
        {
          'adminId': adminId,
          'bearerToken': bearerToken,
        },
      );

  _i2.Future<_i3.Admin?> updateAdmin(
    _i3.Admin admin, {
    String? bearerToken,
  }) =>
      caller.callServerEndpoint<_i3.Admin?>(
        'admin',
        'updateAdmin',
        {
          'admin': admin,
          'bearerToken': bearerToken,
        },
      );

  _i2.Future<bool> deleteAdmin(
    int adminId, {
    String? bearerToken,
  }) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'deleteAdmin',
        {
          'adminId': adminId,
          'bearerToken': bearerToken,
        },
      );
}

/// {@category Endpoint}
class EndpointAkun extends _i1.EndpointRef {
  EndpointAkun(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'akun';

  _i2.Future<_i4.Akun?> addAkun(_i4.Akun akun) =>
      caller.callServerEndpoint<_i4.Akun?>(
        'akun',
        'addAkun',
        {'akun': akun},
      );

  _i2.Future<List<_i4.Akun>> getAllAkun() =>
      caller.callServerEndpoint<List<_i4.Akun>>(
        'akun',
        'getAllAkun',
        {},
      );

  _i2.Future<_i4.Akun?> getAkunById(int id) =>
      caller.callServerEndpoint<_i4.Akun?>(
        'akun',
        'getAkunById',
        {'id': id},
      );

  _i2.Future<_i4.Akun?> updateAkun(_i4.Akun akun) =>
      caller.callServerEndpoint<_i4.Akun?>(
        'akun',
        'updateAkun',
        {'akun': akun},
      );

  _i2.Future<bool> deleteAkun(int id) => caller.callServerEndpoint<bool>(
        'akun',
        'deleteAkun',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<_i5.AuthResponse> signIn({
    required String username,
    required String password,
  }) =>
      caller.callServerEndpoint<_i5.AuthResponse>(
        'auth',
        'signIn',
        {
          'username': username,
          'password': password,
        },
      );

  _i2.Future<void> signOut({String? bearerToken}) =>
      caller.callServerEndpoint<void>(
        'auth',
        'signOut',
        {'bearerToken': bearerToken},
      );

  _i2.Future<_i6.UserProfile?> getMyAkunInfo({String? bearerToken}) =>
      caller.callServerEndpoint<_i6.UserProfile?>(
        'auth',
        'getMyAkunInfo',
        {'bearerToken': bearerToken},
      );
}

/// {@category Endpoint}
class EndpointBroadcast extends _i1.EndpointRef {
  EndpointBroadcast(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'broadcast';

  _i2.Future<_i7.Broadcast?> addBroadcast(
    _i7.Broadcast broadcast, {
    String? bearerToken,
  }) =>
      caller.callServerEndpoint<_i7.Broadcast?>(
        'broadcast',
        'addBroadcast',
        {
          'broadcast': broadcast,
          'bearerToken': bearerToken,
        },
      );

  _i2.Future<List<_i7.Broadcast>> getAllBroadcasts({String? bearerToken}) =>
      caller.callServerEndpoint<List<_i7.Broadcast>>(
        'broadcast',
        'getAllBroadcasts',
        {'bearerToken': bearerToken},
      );

  _i2.Future<_i7.Broadcast?> getBroadcastById(
    int id, {
    String? bearerToken,
  }) =>
      caller.callServerEndpoint<_i7.Broadcast?>(
        'broadcast',
        'getBroadcastById',
        {
          'id': id,
          'bearerToken': bearerToken,
        },
      );

  _i2.Future<_i7.Broadcast?> updateBroadcast(
    _i7.Broadcast broadcast, {
    String? bearerToken,
  }) =>
      caller.callServerEndpoint<_i7.Broadcast?>(
        'broadcast',
        'updateBroadcast',
        {
          'broadcast': broadcast,
          'bearerToken': bearerToken,
        },
      );

  _i2.Future<bool> deleteBroadcast(
    int id, {
    String? bearerToken,
  }) =>
      caller.callServerEndpoint<bool>(
        'broadcast',
        'deleteBroadcast',
        {
          'id': id,
          'bearerToken': bearerToken,
        },
      );
}

/// {@category Endpoint}
class EndpointDashboard extends _i1.EndpointRef {
  EndpointDashboard(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'dashboard';

  _i2.Future<int> getTotalMembers() => caller.callServerEndpoint<int>(
        'dashboard',
        'getTotalMembers',
        {},
      );

  _i2.Future<int> getValidMembers() => caller.callServerEndpoint<int>(
        'dashboard',
        'getValidMembers',
        {},
      );

  _i2.Future<int> getSalesCount() => caller.callServerEndpoint<int>(
        'dashboard',
        'getSalesCount',
        {},
      );

  /// Contoh data chart, kumpulkan member baru berdasarkan mode & period
  /// mode = 'yearly' / 'monthly'
  /// period = '2023' / 'Februari' (opsional)
  _i2.Future<Map<String, int>> getMemberChartData({
    required String mode,
    String? period,
  }) =>
      caller.callServerEndpoint<Map<String, int>>(
        'dashboard',
        'getMemberChartData',
        {
          'mode': mode,
          'period': period,
        },
      );
}

/// {@category Endpoint}
class EndpointDatabaseMember extends _i1.EndpointRef {
  EndpointDatabaseMember(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'databaseMember';

  _i2.Future<List<_i8.DatabaseMember>> getAllDatabaseMembers() =>
      caller.callServerEndpoint<List<_i8.DatabaseMember>>(
        'databaseMember',
        'getAllDatabaseMembers',
        {},
      );

  _i2.Future<_i8.DatabaseMember?> getDatabaseMemberById(int id) =>
      caller.callServerEndpoint<_i8.DatabaseMember?>(
        'databaseMember',
        'getDatabaseMemberById',
        {'id': id},
      );

  _i2.Future<List<_i8.DatabaseMember>> getDatabaseMemberByPelangganId(
          int pelangganId) =>
      caller.callServerEndpoint<List<_i8.DatabaseMember>>(
        'databaseMember',
        'getDatabaseMemberByPelangganId',
        {'pelangganId': pelangganId},
      );

  _i2.Future<bool> addDatabaseMember(_i8.DatabaseMember databaseMember) =>
      caller.callServerEndpoint<bool>(
        'databaseMember',
        'addDatabaseMember',
        {'databaseMember': databaseMember},
      );

  _i2.Future<bool> updateDatabaseMember(_i8.DatabaseMember databaseMember) =>
      caller.callServerEndpoint<bool>(
        'databaseMember',
        'updateDatabaseMember',
        {'databaseMember': databaseMember},
      );

  _i2.Future<bool> deleteDatabaseMember(int id) =>
      caller.callServerEndpoint<bool>(
        'databaseMember',
        'deleteDatabaseMember',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointInformasi extends _i1.EndpointRef {
  EndpointInformasi(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'informasi';

  _i2.Future<List<_i9.Informasi>> getAllInformasi() =>
      caller.callServerEndpoint<List<_i9.Informasi>>(
        'informasi',
        'getAllInformasi',
        {},
      );

  _i2.Future<_i9.Informasi?> getInformasiById(int id) =>
      caller.callServerEndpoint<_i9.Informasi?>(
        'informasi',
        'getInformasiById',
        {'id': id},
      );

  _i2.Future<_i9.Informasi> addInformasi(_i9.Informasi informasi) =>
      caller.callServerEndpoint<_i9.Informasi>(
        'informasi',
        'addInformasi',
        {'informasi': informasi},
      );

  _i2.Future<_i9.Informasi> updateInformasi(_i9.Informasi informasi) =>
      caller.callServerEndpoint<_i9.Informasi>(
        'informasi',
        'updateInformasi',
        {'informasi': informasi},
      );

  _i2.Future<bool> deleteInformasi({required int id}) =>
      caller.callServerEndpoint<bool>(
        'informasi',
        'deleteInformasi',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointMember extends _i1.EndpointRef {
  EndpointMember(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'member';

  _i2.Future<List<_i10.Member>> getAllMembers() =>
      caller.callServerEndpoint<List<_i10.Member>>(
        'member',
        'getAllMembers',
        {},
      );

  _i2.Future<_i10.Member?> getMemberById(int id) =>
      caller.callServerEndpoint<_i10.Member?>(
        'member',
        'getMemberById',
        {'id': id},
      );

  _i2.Future<bool> addMember(_i10.Member member) =>
      caller.callServerEndpoint<bool>(
        'member',
        'addMember',
        {'member': member},
      );

  _i2.Future<bool> updateMember(_i10.Member member) =>
      caller.callServerEndpoint<bool>(
        'member',
        'updateMember',
        {'member': member},
      );

  _i2.Future<bool> deleteMember(int id) => caller.callServerEndpoint<bool>(
        'member',
        'deleteMember',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointSales extends _i1.EndpointRef {
  EndpointSales(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sales';

  _i2.Future<List<_i11.Sales>> getAllSales() =>
      caller.callServerEndpoint<List<_i11.Sales>>(
        'sales',
        'getAllSales',
        {},
      );

  _i2.Future<_i11.Sales?> getSalesById(int id) =>
      caller.callServerEndpoint<_i11.Sales?>(
        'sales',
        'getSalesById',
        {'id': id},
      );

  _i2.Future<bool> addSales(_i11.Sales sales) =>
      caller.callServerEndpoint<bool>(
        'sales',
        'addSales',
        {'sales': sales},
      );

  _i2.Future<bool> updateSales(_i11.Sales sales) =>
      caller.callServerEndpoint<bool>(
        'sales',
        'updateSales',
        {'sales': sales},
      );

  _i2.Future<bool> deleteSales(int id) => caller.callServerEndpoint<bool>(
        'sales',
        'deleteSales',
        {'id': id},
      );

  _i2.Future<List<_i10.Member>> getSalesMembers(int salesId) =>
      caller.callServerEndpoint<List<_i10.Member>>(
        'sales',
        'getSalesMembers',
        {'salesId': salesId},
      );

  _i2.Future<bool> addMemberToSales(
    int salesId,
    _i10.Member member,
  ) =>
      caller.callServerEndpoint<bool>(
        'sales',
        'addMemberToSales',
        {
          'salesId': salesId,
          'member': member,
        },
      );

  _i2.Future<bool> removeMemberFromSales(
    int salesId,
    int memberId,
  ) =>
      caller.callServerEndpoint<bool>(
        'sales',
        'removeMemberFromSales',
        {
          'salesId': salesId,
          'memberId': memberId,
        },
      );
}

class Modules {
  Modules(Client client) {
    auth = _i12.Caller(client);
  }

  late final _i12.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i13.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    admin = EndpointAdmin(this);
    akun = EndpointAkun(this);
    auth = EndpointAuth(this);
    broadcast = EndpointBroadcast(this);
    dashboard = EndpointDashboard(this);
    databaseMember = EndpointDatabaseMember(this);
    example = EndpointExample(this);
    informasi = EndpointInformasi(this);
    member = EndpointMember(this);
    sales = EndpointSales(this);
    modules = Modules(this);
  }

  late final EndpointAdmin admin;

  late final EndpointAkun akun;

  late final EndpointAuth auth;

  late final EndpointBroadcast broadcast;

  late final EndpointDashboard dashboard;

  late final EndpointDatabaseMember databaseMember;

  late final EndpointExample example;

  late final EndpointInformasi informasi;

  late final EndpointMember member;

  late final EndpointSales sales;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'admin': admin,
        'akun': akun,
        'auth': auth,
        'broadcast': broadcast,
        'dashboard': dashboard,
        'databaseMember': databaseMember,
        'example': example,
        'informasi': informasi,
        'member': member,
        'sales': sales,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
