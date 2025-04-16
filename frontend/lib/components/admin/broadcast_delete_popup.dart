// In frontend/lib/components/admin/broadcast_delete_popup.dart
import 'package:jaspr/jaspr.dart';
import '../../services/broadcast_service.dart'; // Import service

class BroadcastDeletePopup extends StatelessComponent {
  // Receive primitives passed down by BroadcastPage
  final int broadcastIdToDelete;
  final String broadcastPesanPreview;

  const BroadcastDeletePopup({
    required this.broadcastIdToDelete,
    required this.broadcastPesanPreview,
    super.key,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'delete-popup-overlay', [
      div(classes: 'delete-popup', [
        h3([text('Konfirmasi Hapus Broadcast')]),
        p([ text('Anda yakin ingin menghapus pesan broadcast ini?') ]),
        p([ text('ID: $broadcastIdToDelete') ]), // Show ID received
        div(classes: 'popup-actions', [
          // Confirm button calls service delete method
          button(classes: 'delete-button',
             onClick: () => BroadcastService.instance.deleteBroadcast(), // Service knows which one to delete from its state
             [ text('Ya, Hapus') ]
          ),
          // Cancel button calls service cancel method
          button(classes: 'cancel-button',
             onClick: () => BroadcastService.instance.cancelFormOrDelete(),
             [ text('Batal') ]
          ),
        ]),
      ]),
    ]);
  }


}