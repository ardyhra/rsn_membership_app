// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:frontend/components/admin/admin_layout.dart' as prefix0;
import 'package:frontend/components/admin/charts.dart' as prefix1;
import 'package:frontend/components/admin/information_list.dart' as prefix2;
import 'package:frontend/pages/admin/database_page.dart' as prefix3;
import 'package:frontend/pages/admin/formulir_page.dart' as prefix4;
import 'package:frontend/pages/admin/member_page.dart' as prefix5;
import 'package:frontend/pages/admin/sales_page.dart' as prefix6;
import 'package:frontend/pages/about.dart' as prefix7;
import 'package:frontend/pages/home.dart' as prefix8;
import 'package:frontend/app.dart' as prefix9;

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
    prefix1.ChartComponent: ClientTarget<prefix1.ChartComponent>('components/admin/charts'),
    prefix2.InformationList: ClientTarget<prefix2.InformationList>('components/admin/information_list'),
    prefix7.About: ClientTarget<prefix7.About>('pages/about'),
    prefix3.DatabasePage: ClientTarget<prefix3.DatabasePage>('pages/admin/database_page'),
    prefix4.FormulirPage: ClientTarget<prefix4.FormulirPage>('pages/admin/formulir_page'),
    prefix5.MemberPage: ClientTarget<prefix5.MemberPage>('pages/admin/member_page'),
    prefix6.SalesPage: ClientTarget<prefix6.SalesPage>('pages/admin/sales_page'),
    prefix8.Home: ClientTarget<prefix8.Home>('pages/home'),
  },
  styles: () => [
    ...prefix0.AdminLayout.styles,
    ...prefix7.About.styles,
    ...prefix9.App.styles,
  ],
);
