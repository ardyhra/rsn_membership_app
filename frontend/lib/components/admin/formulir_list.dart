import 'package:jaspr/jaspr.dart';

class FormulirList extends StatelessComponent {
  const FormulirList({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'formulir-list', [
      h1([text('Formulir')]),
      div(classes: 'formulir-filter-buttons', [
        button(classes: 'formulir-filter-button active', [text('Semua')]),
        button(classes: 'formulir-filter-button', [text('Valid')]),
        button(classes: 'formulir-filter-button', [text('Belum Valid')]),
      ]),
      table(classes: 'formulir-table', [
        thead([
          tr([
            th([text('Member')]),
            th([text('Tanggal')]),
            th([text('Sales')]),
            th([text('Status')]),
          ])
        ]),
        tbody([
          for (var item in _dummyData())
            tr([
              td([text(item['member']!)]),
              td([text(item['date']!)]),
              td([text(item['sales']!)]),
              td([
                span(
                  classes: 'tag ${item['status'] == 'valid' ? 'valid' : 'belum-valid'}',
                  [text(item['status'] == 'valid' ? 'Valid' : 'Belum Valid')],
                ),
              ]),
            ]),
        ]),
      ]),
      div(classes: 'pagination', [
        button([text('<')]),
        button([text('>')]),
      ]),
      div(classes: 'formulir-add-button-container', [
        button(classes: 'formulir-add-button', [text('+ Tambah Formulir')])
      ]),
    ]);
  }

  List<Map<String, String>> _dummyData() {
    return [
      {'member': 'Agus', 'date': '21 Oktober 2024', 'sales': 'Aditya', 'status': 'valid'},
      {'member': 'Budi', 'date': '22 Oktober 2024', 'sales': 'Dewi', 'status': 'belum valid'},
      {'member': 'Citra', 'date': '23 Oktober 2024', 'sales': 'Eka', 'status': 'valid'},
      {'member': 'Dian', 'date': '24 Oktober 2024', 'sales': 'Fikri', 'status': 'belum valid'},
      {'member': 'Eko', 'date': '25 Oktober 2024', 'sales': 'Gita', 'status': 'valid'},
      {'member': 'Fajar', 'date': '26 Oktober 2024', 'sales': 'Hadi', 'status': 'belum valid'},
      {'member': 'Gita', 'date': '27 Oktober 2024', 'sales': 'Ika', 'status': 'valid'},
      {'member': 'Hadi', 'date': '28 Oktober 2024', 'sales': 'Joko', 'status': 'belum valid'},
      {'member': 'Ika', 'date': '29 Oktober 2024', 'sales': 'Kiki', 'status': 'valid'},
      {'member': 'Joko', 'date': '30 Oktober 2024', 'sales': 'Lala', 'status': 'belum valid'},
      {'member': 'Kiki', 'date': '31 Oktober 2024', 'sales': 'Mama', 'status': 'valid'},
      {'member': 'Lala', 'date': '1 November 2024', 'sales': 'Nana', 'status': 'belum valid'},
      {'member': 'Mama', 'date': '2 November 2024', 'sales': 'Oca', 'status': 'valid'},
      {'member': 'Nana', 'date': '3 November 2024', 'sales': 'Pipi', 'status': 'belum valid'},
      {'member': 'Oca', 'date': '4 November 2024', 'sales': 'Qiqi', 'status': 'valid'},
      {'member': 'Pipi', 'date': '5 November 2024', 'sales': 'Rara', 'status': 'belum valid'},
      {'member': 'Qiqi', 'date': '6 November 2024', 'sales': 'Sasa', 'status': 'valid'},
      {'member': 'Rara', 'date': '7 November 2024', 'sales': 'Tata', 'status': 'belum valid'},
      {'member': 'Sasa', 'date': '8 November 2024', 'sales': 'Udin', 'status': 'valid'},
      {'member': 'Tata', 'date': '9 November 2024', 'sales': 'Vivi', 'status': 'belum valid'}
    ];
  }
}
