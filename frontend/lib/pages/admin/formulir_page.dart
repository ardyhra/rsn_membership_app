import 'package:jaspr/jaspr.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/formulir_list.dart';
import '../../components/admin/formulir_form.dart';

class FormulirPage extends StatelessComponent {
  const FormulirPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'formulir-page', [
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/formulir-handler.js'},
        ),
        FormulirList(),
        FormulirForm(),
      ]),
    );
  }
}
