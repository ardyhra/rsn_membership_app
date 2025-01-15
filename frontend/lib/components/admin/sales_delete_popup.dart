import 'package:jaspr/jaspr.dart';

class SalesDeletePopup extends StatelessComponent {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const SalesDeletePopup({
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'delete-popup-overlay', [
      div(classes: 'delete-popup', [
        h3([text('Apakah Anda yakin ingin menghapus data sales ini?')]),
        div(classes: 'popup-actions', [
          button(classes: 'confirm-button', onClick: onConfirm, [text('Hapus')]),
          button(classes: 'cancel-button', onClick: onCancel, [text('Batal')]),
        ]),
      ]),
    ]);
  }
}
