import 'package:jaspr/jaspr.dart';

class MemberListComponent extends StatelessComponent {
  const MemberListComponent({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'member-list-container', [
      table(classes: 'member-table', [
        thead([
          tr([
            th([text('MEMBER')]),
            th([text('NIK')]),
            th([text('No. WhatsApp')]),
            th([text('STATUS')]),
            th([text('AKSI')]),
          ])
        ]),
        tbody([
          for (var i = 0; i < 10; i++)
            tr([
              td([text(i % 2 == 0 ? 'Agus' : 'Budi')]),
              td([text('620101090205000${i + 1}')]),
              td([text('08214659120${i}')]),
              td([
                span(
                  classes: i % 2 == 0 ? 'status-box valid' : 'status-box invalid',
                  [text(i % 2 == 0 ? 'Valid' : 'Belum Valid')],
                )
              ]),
              td([
                button(
                  classes: i % 2 == 0 ? 'action-button edit' : 'action-button verify',
                  [text(i % 2 == 0 ? 'UBAH' : 'VERIFIKASI')],
                )
              ]),
            ]),
        ]),
      ]),
      // Pagination Container
      div(classes: 'pagination-container', [
        button(classes: 'pagination-button previous', attributes: {'data-action': 'prev'}, [text('<')]),
        span(classes: 'pagination-info', [text('Halaman 1 dari X')]), // Updated dynamically
        button(classes: 'pagination-button next', attributes: {'data-action': 'next'}, [text('>')]),
      ]),
    ]);
  }
}
