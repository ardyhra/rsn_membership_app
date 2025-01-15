// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:frontend/components/admin/admin_layout.dart' as prefix0;
import 'package:frontend/components/admin/charts.dart' as prefix1;
import 'package:frontend/components/admin/information_list.dart' as prefix2;
import 'package:frontend/pages/about.dart' as prefix3;
import 'package:frontend/pages/home.dart' as prefix4;
import 'package:frontend/app.dart' as prefix5;

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
    prefix3.About: ClientTarget<prefix3.About>('pages/about'),
    prefix4.Home: ClientTarget<prefix4.Home>('pages/home'),
  },
  styles: () => [
    ...prefix0.AdminLayout.styles,
    ...prefix3.About.styles,
    ...prefix5.App.styles,
  ],
);
