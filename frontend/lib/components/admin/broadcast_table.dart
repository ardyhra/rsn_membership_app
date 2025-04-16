// In frontend/lib/components/admin/broadcast_table.dart
import 'package:jaspr/jaspr.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:membership_app_client/membership_app_client.dart';
import '../../services/broadcast_service.dart'; // Import service

class BroadcastTable extends StatelessComponent {
  final List<Broadcast> broadcasts; // Receive the list of objects

  const BroadcastTable({ required this.broadcasts, super.key });

  String getTujuanText(int tujuanCode) {
    switch (tujuanCode) { /* ... same as before ... */ }
    return 'Unknown';
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield table(classes: 'broadcast-table data-table', [
      thead([
        tr([
          th([text('Pesan')]),
          th([text('Tujuan')]),
          th([text('Tanggal Dibuat')]),
          th([text('Aksi')]),
        ]),
      ]),
      tbody([
        if (broadcasts.isEmpty)
          tr([td(attributes: {'colspan': '4'}, [text('No broadcast messages found.')])])
        else
          for (final broadcast in broadcasts)
            tr(key: ValueKey(broadcast.id), [ // Add key for efficient updates
              td([text(broadcast.pesan)]),
              td([text(getTujuanText(broadcast.tujuan))]),
              td([text(DateFormat('yyyy-MM-dd HH:mm').format(broadcast.tanggalDibuat.toLocal()))]),
              td(classes: 'action-cell', [
                // Edit button calls service method directly
                button(classes: 'edit-button icon-button', attributes: {'title': 'Edit'},
                   onClick: () => BroadcastService.instance.startEdit(broadcast),
                   [ i([],classes: 'fas fa-pencil-alt') ]
                ),
                // Delete button calls service method directly
                button(classes: 'delete-button icon-button', attributes: {'title': 'Edit'},
                   onClick: () => BroadcastService.instance.startDelete(broadcast),
                    [ i([],classes: 'fas fa-trash-alt') ]
                ),
              ]),
            ]),
      ]),
    ]);
  }
}