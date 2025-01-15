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
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/informasi_endpoint.dart' as _i3;
import 'package:membership_app_server/src/generated/informasi.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'informasi': _i3.InformasiEndpoint()
        ..initialize(
          server,
          'informasi',
          null,
        ),
    };
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
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
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
              (endpoints['informasi'] as _i3.InformasiEndpoint)
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
              (endpoints['informasi'] as _i3.InformasiEndpoint)
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
              type: _i1.getType<_i4.Informasi>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i3.InformasiEndpoint).addInformasi(
            session,
            params['informasi'],
          ),
        ),
        'updateInformasi': _i1.MethodConnector(
          name: 'updateInformasi',
          params: {
            'informasi': _i1.ParameterDescription(
              name: 'informasi',
              type: _i1.getType<_i4.Informasi>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['informasi'] as _i3.InformasiEndpoint).updateInformasi(
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
              (endpoints['informasi'] as _i3.InformasiEndpoint).deleteInformasi(
            session,
            id: params['id'],
          ),
        ),
      },
    );
  }
}
