// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:frontend/components/admin/admin_layout.dart' as prefix0;
import 'package:frontend/components/admin/charts.dart' as prefix1;
import 'package:frontend/components/admin/information_list.dart' as prefix2;
import 'package:frontend/pages/admin/member_page.dart' as prefix3;
import 'package:frontend/pages/about.dart' as prefix4;
import 'package:frontend/pages/home.dart' as prefix5;
import 'package:frontend/app.dart' as prefix6;

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
    prefix4.About: ClientTarget<prefix4.About>('pages/about'),
    prefix3.MemberPage: ClientTarget<prefix3.MemberPage>('pages/admin/member_page'),
    prefix5.Home: ClientTarget<prefix5.Home>('pages/home'),
  },
  styles: () => [
    ...prefix0.AdminLayout.styles,
    ...prefix4.About.styles,
    ...prefix6.App.styles,
  ],
);
