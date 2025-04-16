// In frontend/lib/pages/broadcast_page.dart

import 'package:jaspr/jaspr.dart';
// No need for client here if service handles calls
import 'package:membership_app_client/membership_app_client.dart' show Broadcast; // Only need type if passing to children
import '../../components/admin/admin_layout.dart';
import '../../components/admin/broadcast_table.dart';
import '../../components/admin/broadcast_form.dart';
import '../../components/admin/broadcast_delete_popup.dart';
import '../../services/broadcast_service.dart'; // Import the service

@client
class BroadcastPage extends StatefulComponent {
  const BroadcastPage({super.key});
  @override
  State<BroadcastPage> createState() => _BroadcastPageState();
}

class _BroadcastPageState extends State<BroadcastPage> {

  // Get service instance
  final _broadcastService = BroadcastService.instance;

  @override
  void initState() {
    super.initState();
    print("[CLIENT BroadcastPage] initState: Initializing BroadcastService & fetching data...");
    // Ensure service is initialized (gets token) and fetch initial list
    // Note: Initialize might be better called once at App level
    _broadcastService.initialize();
    _broadcastService.fetchBroadcasts();

    // Assume ProfileService fetch for Navbar is handled by AdminLayout/App
  }

  // No dispose needed here if service is a singleton living longer

  @override
  Iterable<Component> build(BuildContext context) sync* {
  // Wrap everything in AdminLayout
  yield AdminLayout(
    // Wrap the result of the helper in a Fragment or div
    child: Fragment(children: buildBroadcastContent(context).toList()),
    // Or: child: div(buildBroadcastContent(context)), // Use div if needed
  );
}

  // This part listens to the service and builds the page content
  Iterable<Component> buildBroadcastContent(BuildContext context) sync* {
      // Use StreamBuilder on the service's stream
      yield StreamBuilder<BroadcastState>(
          stream: _broadcastService.broadcastStateStream,
          initialData: _broadcastService.currentInitialState, // Provide initial state
          builder: (context, snapshot) sync* {
             final state = snapshot.data!; // State from BroadcastService

             // --- Render Notification ---
             if (state.notificationMessage != null) {
                 // Use a Key to help Jaspr efficiently update/remove the notification
                 yield div(
                     key: ValueKey(state.notificationMessage),
                     classes: 'notif ${state.isNotificationSuccess ? 'success' : 'error'} notification-area', // Added class
                     [ span([text(state.notificationMessage!)]) ] // Wrap text in span for styling
                 );
             }

             // --- Render Form or List View ---
             if (state.isAddOrEditMode) {
                  // FORM VIEW
                   yield BroadcastForm(
                      // Key forces state recreation when switching between add/edit
                      key: ValueKey(state.broadcastToEdit?.id?.toString() ?? 'add'),
                      // Pass initial data as primitives
                      isEdit: state.broadcastToEdit != null,
                      editId: state.broadcastToEdit?.id,
                      initialPesan: state.broadcastToEdit?.pesan ?? '',
                      initialTujuan: state.broadcastToEdit?.tujuan ?? 0,
                      // onSubmit and onCancel are now handled by buttons inside form calling service
                   );
             } else {
                 // LIST VIEW
                  yield div(classes: 'broadcast-page-list-view', [
                      // Header and Add Button
                      div(classes: 'page-header', [
                         h1([text('Broadcast History')]),
                         // Button calls service method directly
                         button(classes: 'add-button', onClick: _broadcastService.startAdd, [
                             i([],classes: 'fas fa-plus'), text(' Buat Pesan')
                         ]),
                      ]),

                      // Loading or Table
                      if (state.isLoading)
                          Center(child: Text('Memuat data broadcast...'))
                      else if (state.broadcastList.isEmpty)
                          Center(child: p([text('Belum ada data broadcast.')]))
                      else
                          BroadcastTable(
                             // Pass the list of broadcast objects
                             broadcasts: state.broadcastList,
                             // Actions in table call service directly, no callbacks needed here
                          ),
                      // TODO: Add Pagination component here if needed
                      // It would read state.broadcastList.length and manage current page state locally or via service
                  ]);
             }

              // --- Render Delete Popup ---
              if (state.broadcastToDelete != null) {
                 final broadcast = state.broadcastToDelete!;
                 // Create preview text safely
                 String preview = broadcast.pesan.length > 50
                                  ? broadcast.pesan.substring(0, 50) + '...'
                                  : broadcast.pesan;
                 yield BroadcastDeletePopup(
                     // Pass data needed by popup
                     broadcastIdToDelete: broadcast.id!,
                     broadcastPesanPreview: preview,
                 );
              }
          } // End StreamBuilder builder
      ); // End StreamBuilder
  } // End buildBroadcastContent
} // End _BroadcastPageState

// Helper component for centering loading/empty messages
class Center extends StatelessComponent {
  final Component child;
  const Center({required this.child, Key? key}) : super(key: key);

  @override
  Iterable<Component> build(BuildContext context) sync* {
     yield div(
       styles: Styles.flexbox(justifyContent: JustifyContent.center, alignItems: AlignItems.center).box(minHeight: 200.px, padding: EdgeInsets.all(20.px)),
       [child]
     );
  }
}