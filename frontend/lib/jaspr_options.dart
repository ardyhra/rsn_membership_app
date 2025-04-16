// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:frontend/components/admin/admin_layout.dart' as prefix0;
import 'package:frontend/components/admin/broadcast_form.dart' as prefix1;
import 'package:frontend/components/admin/charts.dart' as prefix2;
import 'package:frontend/components/admin/information_list.dart' as prefix3;
import 'package:frontend/components/admin/navbar.dart' as prefix4;
import 'package:frontend/components/login_form_desktop.dart' as prefix5;
import 'package:frontend/pages/admin/broadcast_page.dart' as prefix6;
import 'package:frontend/pages/admin/dashboard_page.dart' as prefix7;
import 'package:frontend/pages/admin/database_page.dart' as prefix8;
import 'package:frontend/pages/admin/formulir_page.dart' as prefix9;
import 'package:frontend/pages/admin/informasi_page.dart' as prefix10;
import 'package:frontend/pages/admin/member_page.dart' as prefix11;
import 'package:frontend/pages/admin/sales_page.dart' as prefix12;
import 'package:frontend/pages/about.dart' as prefix13;
import 'package:frontend/pages/home.dart' as prefix14;
import 'package:frontend/pages/login_page.dart' as prefix15;
import 'package:frontend/app.dart' as prefix16;

/// Default [JasprOptions] for use with your jaspr project.
///
/// Use this to initialize jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'jaspr_options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultJasprOptions,
///   );
///
///   runApp(...);
/// }
/// ```
final defaultJasprOptions = JasprOptions(
  clients: {
    prefix1.BroadcastForm: ClientTarget<prefix1.BroadcastForm>(
      'components/admin/broadcast_form',
      params: _prefix1BroadcastForm,
    ),

    prefix2.ChartDartComponent: ClientTarget<prefix2.ChartDartComponent>(
      'components/admin/charts',
    ),

    prefix3.InformationList: ClientTarget<prefix3.InformationList>(
      'components/admin/information_list',
    ),

    prefix4.Navbar: ClientTarget<prefix4.Navbar>('components/admin/navbar'),

    prefix5.LoginFormDesktop: ClientTarget<prefix5.LoginFormDesktop>(
      'components/login_form_desktop',
    ),

    prefix13.About: ClientTarget<prefix13.About>('pages/about'),

    prefix6.BroadcastPage: ClientTarget<prefix6.BroadcastPage>(
      'pages/admin/broadcast_page',
    ),

    prefix7.DashboardPage: ClientTarget<prefix7.DashboardPage>(
      'pages/admin/dashboard_page',
    ),

    prefix8.DatabasePage: ClientTarget<prefix8.DatabasePage>(
      'pages/admin/database_page',
    ),

    prefix9.FormulirPage: ClientTarget<prefix9.FormulirPage>(
      'pages/admin/formulir_page',
    ),

    prefix10.InformationPage: ClientTarget<prefix10.InformationPage>(
      'pages/admin/informasi_page',
    ),

    prefix11.MemberPage: ClientTarget<prefix11.MemberPage>(
      'pages/admin/member_page',
    ),

    prefix12.SalesPage: ClientTarget<prefix12.SalesPage>(
      'pages/admin/sales_page',
    ),

    prefix14.Home: ClientTarget<prefix14.Home>('pages/home'),

    prefix15.LoginPage: ClientTarget<prefix15.LoginPage>('pages/login_page'),
  },
  styles:
      () => [
        ...prefix0.AdminLayout.styles,

        ...prefix13.About.styles,
        ...prefix16.App.styles,
      ],
);

Map<String, dynamic> _prefix1BroadcastForm(prefix1.BroadcastForm c) => {
  'isEdit': c.isEdit,
  'editId': c.editId,
  'initialPesan': c.initialPesan,
  'initialTujuan': c.initialTujuan,
};
