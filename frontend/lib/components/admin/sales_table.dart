import 'package:jaspr/jaspr.dart';

class SalesTable extends StatelessComponent {
  const SalesTable({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'sales-page', [
      table(classes: 'sales-table', [
        thead([
          tr([
            th([text('MEMBER')]),
            th([text('NIK')]),
            th([text('No. WhatsApp')]),
            th([text('AKSI')]),
          ]),
        ]),
        tbody([
          for (var i = 0; i < 30; i++) // Generate more rows for pagination testing
            tr([
              td([text(i % 2 == 0 ? 'Agus' : 'Cahaya')]),
              td([text('620101090205000${i + 1}')]),
              td([text('08214659120${i}')]),
              td([
                button(
                  classes: 'action-button edit',
                  attributes: {'data-id': '${i + 1}'}, // Untuk ID data
                  [text('✎')],
                ),
                button(
                  classes: 'action-button delete',
                  attributes: {'data-id': '${i + 1}'}, // Untuk ID data
                  [text('🗑')],
                ),
              ]),
            ]),
        ]),
      ]),
      // Pagination Container
      div(classes: 'pagination-container', [
        button(classes: 'pagination-button previous', attributes: {'data-action': 'prev'}, [text('<')]),
        span(classes: 'pagination-info', [text('Page 1 of X')]), // Updated dynamically
        button(classes: 'pagination-button next', attributes: {'data-action': 'next'}, [text('>')]),
      ]),
    ]);
  }
}
