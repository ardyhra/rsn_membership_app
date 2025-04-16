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
import '../endpoints/admin_endpoint.dart' as _i2;
import '../endpoints/akun_endpoint.dart' as _i3;
import '../endpoints/auth_endpoint.dart' as _i4;
import '../endpoints/broadcast_endpoint.dart' as _i5;
import '../endpoints/dashboard_endpoint.dart' as _i6;
import '../endpoints/database_member_endpoint.dart' as _i7;
import '../endpoints/example_endpoint.dart' as _i8;
import '../endpoints/informasi_endpoint.dart' as _i9;
import '../endpoints/member_endpoint.dart' as _i10;
import '../endpoints/sales_endpoint.dart' as _i11;
import 'package:membership_app_server/src/generated/admin.dart' as _i12;
import 'package:membership_app_server/src/generated/akun.dart' as _i13;
import 'package:membership_app_server/src/generated/broadcast.dart' as _i14;
import 'package:membership_app_server/src/generated/database_member.dart'
    as _i15;
import 'package:membership_app_server/src/generated/informasi.dart' as _i16;
import 'package:membership_app_server/src/generated/member.dart' as _i17;
import 'package:membership_app_server/src/generated/sales.dart' as _i18;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i19;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'admin': _i2.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'akun': _i3.AkunEndpoint()
        ..initialize(
          server,
          'akun',
          null,
        ),
      'auth': _i4.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'broadcast': _i5.BroadcastEndpoint()
        ..initialize(
          server,
          'broadcast',
          null,
        ),
      'dashboard': _i6.DashboardEndpoint()
        ..initialize(
          server,
          'dashboard',
          null,
        ),
      'databaseMember': _i7.DatabaseMemberEndpoint()
        ..initialize(
          server,
          'databaseMember',
          null,
        ),
      'example': _i8.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'informasi': _i9.InformasiEndpoint()
        ..initialize(
          server,
          'informasi',
          null,
        ),
      'member': _i10.MemberEndpoint()
        ..initialize(
          server,
          'member',
          null,
        ),
      'sales': _i11.SalesEndpoint()
        ..initialize(
          server,
          'sales',
          null,
        ),
    };
    connectors['admin'] = _i1.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'addAdmin': _i1.MethodConnector(
          name: 'addAdmin',
          params: {
            'admin': _i1.ParameterDescription(
              name: 'admin',
              type: _i1.getType<_i12.Admin>(),
              nullable: false,
            ),
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).addAdmin(
            session,
            params['admin'],
            bearerToken: params['bearerToken'],
          ),
        ),
        'getAllAdmins': _i1.MethodConnector(
          name: 'getAllAdmins',
          params: {
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).getAllAdmins(
            session,
            bearerToken: params['bearerToken'],
          ),
        ),
        'getAdminById': _i1.MethodConnector(
          name: 'getAdminById',
          params: {
            'adminId': _i1.ParameterDescription(
              name: 'adminId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).getAdminById(
            session,
            params['adminId'],
            bearerToken: params['bearerToken'],
          ),
        ),
        'updateAdmin': _i1.MethodConnector(
          name: 'updateAdmin',
          params: {
            'admin': _i1.ParameterDescription(
              name: 'admin',
              type: _i1.getType<_i12.Admin>(),
              nullable: false,
            ),
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).updateAdmin(
            session,
            params['admin'],
            bearerToken: params['bearerToken'],
          ),
        ),
        'deleteAdmin': _i1.MethodConnector(
          name: 'deleteAdmin',
          params: {
            'adminId': _i1.ParameterDescription(
              name: 'adminId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['admin'] as _i2.AdminEndpoint).deleteAdmin(
            session,
            params['adminId'],
            bearerToken: params['bearerToken'],
          ),
        ),
      },
    );
    connectors['akun'] = _i1.EndpointConnector(
      name: 'akun',
      endpoint: endpoints['akun']!,
      methodConnectors: {
        'addAkun': _i1.MethodConnector(
          name: 'addAkun',
          params: {
            'akun': _i1.ParameterDescription(
              name: 'akun',
              type: _i1.getType<_i13.Akun>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['akun'] as _i3.AkunEndpoint).addAkun(
            session,
            params['akun'],
          ),
        ),
        'getAllAkun': _i1.MethodConnector(
          name: 'getAllAkun',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['akun'] as _i3.AkunEndpoint).getAllAkun(session),
        ),
        'getAkunById': _i1.MethodConnector(
          name: 'getAkunById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['akun'] as _i3.AkunEndpoint).getAkunById(
            session,
            params['id'],
          ),
        ),
        'updateAkun': _i1.MethodConnector(
          name: 'updateAkun',
          params: {
            'akun': _i1.ParameterDescription(
              name: 'akun',
              type: _i1.getType<_i13.Akun>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['akun'] as _i3.AkunEndpoint).updateAkun(
            session,
            params['akun'],
          ),
        ),
        'deleteAkun': _i1.MethodConnector(
          name: 'deleteAkun',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['akun'] as _i3.AkunEndpoint).deleteAkun(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'signIn': _i1.MethodConnector(
          name: 'signIn',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i4.AuthEndpoint).signIn(
            session,
            username: params['username'],
            password: params['password'],
          ),
        ),
        'signOut': _i1.MethodConnector(
          name: 'signOut',
          params: {
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i4.AuthEndpoint).signOut(
            session,
            bearerToken: params['bearerToken'],
          ),
        ),
        'getMyAkunInfo': _i1.MethodConnector(
          name: 'getMyAkunInfo',
          params: {
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i4.AuthEndpoint).getMyAkunInfo(
            session,
            bearerToken: params['bearerToken'],
          ),
        ),
      },
    );
    connectors['broadcast'] = _i1.EndpointConnector(
      name: 'broadcast',
      endpoint: endpoints['broadcast']!,
      methodConnectors: {
        'addBroadcast': _i1.MethodConnector(
          name: 'addBroadcast',
          params: {
            'broadcast': _i1.ParameterDescription(
              name: 'broadcast',
              type: _i1.getType<_i14.Broadcast>(),
              nullable: false,
            ),
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['broadcast'] as _i5.BroadcastEndpoint).addBroadcast(
            session,
            params['broadcast'],
            bearerToken: params['bearerToken'],
          ),
        ),
        'getAllBroadcasts': _i1.MethodConnector(
          name: 'getAllBroadcasts',
          params: {
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['broadcast'] as _i5.BroadcastEndpoint)
                  .getAllBroadcasts(
            session,
            bearerToken: params['bearerToken'],
          ),
        ),
        'getBroadcastById': _i1.MethodConnector(
          name: 'getBroadcastById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['broadcast'] as _i5.BroadcastEndpoint)
                  .getBroadcastById(
            session,
            params['id'],
            bearerToken: params['bearerToken'],
          ),
        ),
        'updateBroadcast': _i1.MethodConnector(
          name: 'updateBroadcast',
          params: {
            'broadcast': _i1.ParameterDescription(
              name: 'broadcast',
              type: _i1.getType<_i14.Broadcast>(),
              nullable: false,
            ),
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['broadcast'] as _i5.BroadcastEndpoint).updateBroadcast(
            session,
            params['broadcast'],
            bearerToken: params['bearerToken'],
          ),
        ),
        'deleteBroadcast': _i1.MethodConnector(
          name: 'deleteBroadcast',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'bearerToken': _i1.ParameterDescription(
              name: 'bearerToken',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['broadcast'] as _i5.BroadcastEndpoint).deleteBroadcast(
            session,
            params['id'],
            bearerToken: params['bearerToken'],
          ),
        ),
      },
    );
    connectors['dashboard'] = _i1.EndpointConnector(
      name: 'dashboard',
      endpoint: endpoints['dashboard']!,
      methodConnectors: {
        'getTotalMembers': _i1.MethodConnector(
          name: 'getTotalMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dashboard'] as _i6.DashboardEndpoint)
                  .getTotalMembers(session),
        ),
        'getValidMembers': _i1.MethodConnector(
          name: 'getValidMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dashboard'] as _i6.DashboardEndpoint)
                  .getValidMembers(session),
        ),
        'getSalesCount': _i1.MethodConnector(
          name: 'getSalesCount',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dashboard'] as _i6.DashboardEndpoint)
                  .getSalesCount(session),
        ),
        'getMemberChartData': _i1.MethodConnector(
          name: 'getMemberChartData',
          params: {
            'mode': _i1.ParameterDescription(
              name: 'mode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'period': _i1.ParameterDescription(
              name: 'period',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dashboard'] as _i6.DashboardEndpoint)
                  .getMemberChartData(
            session,
            mode: params['mode'],
            period: params['period'],
          ),
        ),
      },
    );
    connectors['databaseMember'] = _i1.EndpointConnector(
      name: 'databaseMember',
      endpoint: endpoints['databaseMember']!,
      methodConnectors: {
        'getAllDatabaseMembers': _i1.MethodConnector(
          name: 'getAllDatabaseMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i7.DatabaseMemberEndpoint)
                  .getAllDatabaseMembers(session),
        ),
        'getDatabaseMemberById': _i1.MethodConnector(
          name: 'getDatabaseMemberById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i7.DatabaseMemberEndpoint)
                  .getDatabaseMemberById(
            session,
            params['id'],
          ),
        ),
        'getDatabaseMemberByPelangganId': _i1.MethodConnector(
          name: 'getDatabaseMemberByPelangganId',
          params: {
            'pelangganId': _i1.ParameterDescription(
              name: 'pelangganId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i7.DatabaseMemberEndpoint)
                  .getDatabaseMemberByPelangganId(
            session,
            params['pelangganId'],
          ),
        ),
        'addDatabaseMember': _i1.MethodConnector(
          name: 'addDatabaseMember',
          params: {
            'databaseMember': _i1.ParameterDescription(
              name: 'databaseMember',
              type: _i1.getType<_i15.DatabaseMember>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i7.DatabaseMemberEndpoint)
                  .addDatabaseMember(
            session,
            params['databaseMember'],
          ),
        ),
        'updateDatabaseMember': _i1.MethodConnector(
          name: 'updateDatabaseMember',
          params: {
            'databaseMember': _i1.ParameterDescription(
              name: 'databaseMember',
              type: _i1.getType<_i15.DatabaseMember>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i7.DatabaseMemberEndpoint)
                  .updateDatabaseMember(
            session,
            params['databaseMember'],
          ),
        ),
        'deleteDatabaseMember': _i1.MethodConnector(
          name: 'deleteDatabaseMember',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['databaseMember'] as _i7.DatabaseMemberEndpoint)
                  .deleteDatabaseMember(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i8.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['informasi'] = _i1.EndpointConnector(
      name: 'informasi',
      endpoint: endpoints['informasi']!,
      methodConnectors: {
        'getAllInformasi': _i1.MethodConnector(
          name: 'getAllInformasi',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i9.InformasiEndpoint)
                  .getAllInformasi(session),
        ),
        'getInformasiById': _i1.MethodConnector(
          name: 'getInformasiById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i9.InformasiEndpoint)
                  .getInformasiById(
            session,
            params['id'],
          ),
        ),
        'addInformasi': _i1.MethodConnector(
          name: 'addInformasi',
          params: {
            'informasi': _i1.ParameterDescription(
              name: 'informasi',
              type: _i1.getType<_i16.Informasi>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i9.InformasiEndpoint).addInformasi(
            session,
            params['informasi'],
          ),
        ),
        'updateInformasi': _i1.MethodConnector(
          name: 'updateInformasi',
          params: {
            'informasi': _i1.ParameterDescription(
              name: 'informasi',
              type: _i1.getType<_i16.Informasi>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i9.InformasiEndpoint).updateInformasi(
            session,
            params['informasi'],
          ),
        ),
        'deleteInformasi': _i1.MethodConnector(
          name: 'deleteInformasi',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i9.InformasiEndpoint).deleteInformasi(
            session,
            id: params['id'],
          ),
        ),
      },
    );
    connectors['member'] = _i1.EndpointConnector(
      name: 'member',
      endpoint: endpoints['member']!,
      methodConnectors: {
        'getAllMembers': _i1.MethodConnector(
          name: 'getAllMembers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i10.MemberEndpoint)
                  .getAllMembers(session),
        ),
        'getMemberById': _i1.MethodConnector(
          name: 'getMemberById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i10.MemberEndpoint).getMemberById(
            session,
            params['id'],
          ),
        ),
        'addMember': _i1.MethodConnector(
          name: 'addMember',
          params: {
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i17.Member>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i10.MemberEndpoint).addMember(
            session,
            params['member'],
          ),
        ),
        'updateMember': _i1.MethodConnector(
          name: 'updateMember',
          params: {
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i17.Member>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i10.MemberEndpoint).updateMember(
            session,
            params['member'],
          ),
        ),
        'deleteMember': _i1.MethodConnector(
          name: 'deleteMember',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['member'] as _i10.MemberEndpoint).deleteMember(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['sales'] = _i1.EndpointConnector(
      name: 'sales',
      endpoint: endpoints['sales']!,
      methodConnectors: {
        'getAllSales': _i1.MethodConnector(
          name: 'getAllSales',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i11.SalesEndpoint).getAllSales(session),
        ),
        'getSalesById': _i1.MethodConnector(
          name: 'getSalesById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i11.SalesEndpoint).getSalesById(
            session,
            params['id'],
          ),
        ),
        'addSales': _i1.MethodConnector(
          name: 'addSales',
          params: {
            'sales': _i1.ParameterDescription(
              name: 'sales',
              type: _i1.getType<_i18.Sales>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i11.SalesEndpoint).addSales(
            session,
            params['sales'],
          ),
        ),
        'updateSales': _i1.MethodConnector(
          name: 'updateSales',
          params: {
            'sales': _i1.ParameterDescription(
              name: 'sales',
              type: _i1.getType<_i18.Sales>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i11.SalesEndpoint).updateSales(
            session,
            params['sales'],
          ),
        ),
        'deleteSales': _i1.MethodConnector(
          name: 'deleteSales',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i11.SalesEndpoint).deleteSales(
            session,
            params['id'],
          ),
        ),
        'getSalesMembers': _i1.MethodConnector(
          name: 'getSalesMembers',
          params: {
            'salesId': _i1.ParameterDescription(
              name: 'salesId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i11.SalesEndpoint).getSalesMembers(
            session,
            params['salesId'],
          ),
        ),
        'addMemberToSales': _i1.MethodConnector(
          name: 'addMemberToSales',
          params: {
            'salesId': _i1.ParameterDescription(
              name: 'salesId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'member': _i1.ParameterDescription(
              name: 'member',
              type: _i1.getType<_i17.Member>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i11.SalesEndpoint).addMemberToSales(
            session,
            params['salesId'],
            params['member'],
          ),
        ),
        'removeMemberFromSales': _i1.MethodConnector(
          name: 'removeMemberFromSales',
          params: {
            'salesId': _i1.ParameterDescription(
              name: 'salesId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'memberId': _i1.ParameterDescription(
              name: 'memberId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i11.SalesEndpoint).removeMemberFromSales(
            session,
            params['salesId'],
            params['memberId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i19.Endpoints()..initializeEndpoints(server);
  }
}
