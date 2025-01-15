import 'package:jaspr/jaspr.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/member_list_component.dart';
import '../../components/admin/member_verification_component.dart';

class MemberPage extends StatelessComponent {
  const MemberPage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'member-page', attributes: {'data-view': 'list'}, [
        DomComponent(
          tag: 'script',
          attributes: {'src': '/scripts/member-handler.js'},
        ),
        div(classes: 'header-with-search', [
          h1([text('Data Member')]),
          input(
            [],
            type: InputType.text,
            attributes: {'placeholder': 'Cari'},
            classes: 'search-input',
          ),
        ]),
        div(classes: 'formulir-filter-buttons', [
          button(classes: 'formulir-filter-button active', [text('Semua')]),
          button(classes: 'formulir-filter-button', [text('Valid')]),
          button(classes: 'formulir-filter-button', [text('Belum Valid')]),
        ]),
        MemberListComponent(),
        MemberVerificationComponent(),
      ]),
    );
  }
}
