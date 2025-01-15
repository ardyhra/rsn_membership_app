import 'package:jaspr/jaspr.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/sales_table.dart';
import '../../components/admin/sales_form.dart';
import '../../components/admin/sales_delete_popup.dart';

class SalesPage extends StatelessComponent {
  const SalesPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'sales-page', attributes: {'data-view': 'list'}, [
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/sales-handler.js'},
        ),
        div(classes: 'header-with-search', [
          h1([text('Data Sales')]),
          input(
            [],
            type: InputType.text,
            attributes: {'placeholder': 'Cari'},
            classes: 'search-input',
          ),
        ]),
        SalesTable(),
        button(classes: 'add-button', [text('+ Tambah Sales')]),
        SalesForm(
          onSubmit: () => {}, // Logic for saving or updating sales
          onCancel: () => {}, // Logic for cancel action
        ),
        SalesDeletePopup(
          onConfirm: () => {}, // Logic for confirming delete
          onCancel: () => {}, // Logic for cancel delete
        ),
      ]),
    );
  }
}
