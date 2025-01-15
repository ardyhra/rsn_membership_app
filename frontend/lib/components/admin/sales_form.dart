import 'package:jaspr/jaspr.dart';

class SalesForm extends StatelessComponent {
  final String? salesId;
  final VoidCallback onSubmit;
  final VoidCallback onCancel;

  const SalesForm({
    this.salesId,
    required this.onSubmit,
    required this.onCancel,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'sales-form', [
      // h1([text(salesId == null ? 'Tambah Sales' : 'Edit Sales')]),
      div(classes: 'form-group', [
       label(classes: 'form-label', [text('Nama Member')]),
        input(
          [],
          type: InputType.text,
          attributes: {'placeholder': 'Nama Member'},
          classes: 'form-input',
        ),
      ]),
      div(classes: 'form-group', [
        label(classes: 'form-label', [text('NIK')]),
        input(
          [],
          type: InputType.text,
          attributes: {'placeholder': 'NIK'},
          classes: 'form-input',
        ),
      ]),
      div(classes: 'form-group', [
        label(classes: 'form-label', [text('No. WhatsApp')]),
        input(
          [],
          type: InputType.text,
          attributes: {'placeholder': 'No. WhatsApp'},
          classes: 'form-input',
        ),
      ]),
      div(classes: 'form-actions', [
        button(classes: 'submit-button', onClick: onSubmit, [text('SIMPAN')]),
        button(classes: 'cancel-button', onClick: onCancel, [text('BATAL')]),
      ]),
    ]);
  }
}
