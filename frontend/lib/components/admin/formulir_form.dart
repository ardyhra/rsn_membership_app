import 'package:jaspr/jaspr.dart';

class FormulirForm extends StatelessComponent {
  const FormulirForm({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'formulir-form', [
      h1([text('Formulir')]),
      div(classes: 'formulir-form-container', [
        for (var field in ['Nama Sales', 'Nama Pelanggan', 'Alamat KTP'])
          div(classes: 'formulir-form-group', [
            label(classes: 'formulir-form-label', [text(field)]),
            input([], classes: 'formulir-form-input', attributes: {'placeholder': (field)}, type: InputType.text),
          ]),
        div(classes: 'formulir-form-footer', [
          button(classes: 'formulir-form-submit', [text('Konfirmasi')]),
          button(classes: 'formulir-form-cancel', [text('Batal')]),
        ]),
      ]),
    ]);
  }
}
