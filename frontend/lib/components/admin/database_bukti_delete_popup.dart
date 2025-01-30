import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;

class DatabaseBuktiDeletePopup extends StatefulComponent {
  final mem.DatabaseMember bukti;
  final VoidCallback onClose;

  const DatabaseBuktiDeletePopup({
    required this.bukti,
    required this.onClose,
    super.key,
  });

  @override
  State<StatefulComponent> createState() => _DatabaseBuktiDeletePopupState();
}

class _DatabaseBuktiDeletePopupState extends State<DatabaseBuktiDeletePopup> {
  final client = mem.Client('http://localhost:8080/');
  bool isLoading = false;

  Future<void> confirmDelete() async {
    setState(() => isLoading = true);
    try {
      final success = await client.databaseMember.deleteDatabaseMember(component.bukti.id!);
      // handle success/failure
      component.onClose();
    } catch (e) {
      print('Error deleting bukti: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'delete-popup-overlay',
      events: {'click': (_) => component.onClose()},
      [
        div(
          classes: 'delete-popup',
          events: {'click': (evt) => evt.preventDefault()},
          [
            if (isLoading)
              div([text('Menghapus data...')])
            else ...[
              h3([text('Hapus Bukti Pembayaran?')]),
              p([text('Yakin ingin menghapus bukti ini?')]),
              div(classes: 'popup-actions', [
                button(
                  classes: 'confirm-button',
                  onClick: confirmDelete,
                  [text('Hapus')],
                ),
                button(
                  classes: 'cancel-button',
                  onClick: component.onClose,
                  [text('Batal')],
                ),
              ]),
            ],
          ],
        ),
      ],
    );
  }
}
