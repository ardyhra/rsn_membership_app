// In frontend/lib/components/admin/broadcast_form.dart
import 'package:jaspr/jaspr.dart';
// Only need Broadcast type definition, maybe not full client
import 'package:membership_app_client/membership_app_client.dart' show Broadcast;
import '../../services/broadcast_service.dart'; // Import service
import 'package:universal_html/html.dart' as html; // For HTML elements
@client
class BroadcastForm extends StatefulComponent {
  // Receive primitives for initial state - provided by BroadcastPage based on service state
  final bool isEdit;
  final int? editId;
  final String initialPesan;
  final int initialTujuan;

  const BroadcastForm({
    required this.isEdit,
    this.editId,
    this.initialPesan = '',
    this.initialTujuan = 0, // Default to 'Semua'
    super.key,
  });

  @override
  State createState() => _BroadcastFormState();
}

class _BroadcastFormState extends State<BroadcastForm> {
  late String _pesan;
  late int _tujuan;
  final _formKey = GlobalKey();
  bool _isSubmitting = false; // Local state to disable button during submit

  // Get service instance shortcut
  final _broadcastService = BroadcastService.instance;

  @override
  void initState() {
    super.initState();
    _pesan = component.initialPesan;
    _tujuan = component.initialTujuan;
    print("[BroadcastForm] initState: isEdit=${component.isEdit}, editId=${component.editId}");
  }

  // Submit calls the service method
  Future<void> _submitForm() async {
    if (_pesan.trim().isEmpty) {
       _broadcastService.clearNotification(); // Clear previous notification
       // Use service to show notification
       _broadcastService.updateState(_broadcastService.currentInitialState.copyWith(notificationMessage: 'Pesan tidak boleh kosong.', isNotificationSuccess: false));
       return;
    }
    if (_isSubmitting) return;

    setState(() => _isSubmitting = true);

    // Construct object to save
    final broadcastToSave = Broadcast(
      id: component.isEdit ? component.editId : null,
      pesan: _pesan,
      tujuan: _tujuan,
      tanggalDibuat: DateTime.now().toUtc(), // Dummy, server handles this
    );

    // Call service method to save
    await _broadcastService.saveBroadcast(broadcastToSave);

    // Service state change will hide the form. Reset local submitting state if needed.
    if (mounted) {
       setState(() => _isSubmitting = false);
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // Listen to submitting state from service for potentially disabling fields globally?
    // context.listen(_broadcastService.broadcastStateStream.map((s) => s.isSubmitting));
    // final isServiceSubmitting = _broadcastService.currentInitialState.isSubmitting;
    // For now, use local _isSubmitting state.

    yield form(key: _formKey, events: {'submit': (e) { e.preventDefault(); _submitForm(); }}, classes: 'broadcast-form-component', [
      h2([text(component.isEdit ? 'Edit Broadcast' : 'Buat Pesan Broadcast')]),

      div(classes: 'form-group', [
        label(htmlFor: 'broadcast-pesan', [text('Pesan:')]),
        textarea([text(_pesan)],
          id: 'broadcast-pesan', rows: 5, required: true,
          disabled: _isSubmitting,
          events: {'input': (e) => setState(() => _pesan = (e.target as html.TextAreaElement).value ?? '')},
        ),
      ]),

      div(classes: 'form-group', [
        label(htmlFor: 'broadcast-tujuan', [text('Tujuan:')]),
        select(
          id: 'broadcast-tujuan',
          attributes: {'value': _tujuan.toString()},
          disabled: _isSubmitting,
          events: {'change': (e) => setState(() => _tujuan = int.tryParse((e.target as html.SelectElement).value ?? '0') ?? 0)},
          [
            option(value: '0', attributes: {'selected': _tujuan == 0 ? 'true' : 'false'}, [text('Semua')]),
            option(value: '1', attributes: {'selected': _tujuan == 1 ? 'true' : 'false'}, [text('Sales')]),
            option(value: '2', attributes: {'selected': _tujuan == 2 ? 'true' : 'false'}, [text('Member')]),
          ],
        )
      ]),

      div(classes: 'form-actions', [
        button(type: ButtonType.submit, classes: 'submit-button', disabled: _isSubmitting, [
          text(component.isEdit ? (_isSubmitting ? 'Menyimpan...' : 'Update Pesan') : (_isSubmitting ? 'Mengirim...' :'Kirim Pesan'))
        ]),
        // Cancel button calls service directly
        button(type: ButtonType.button, classes: 'cancel-button', disabled: _isSubmitting,
           events: {'click': (_) => BroadcastService.instance.cancelFormOrDelete()},
           [ text('Batal') ]
        ),
      ]),
    ]);
  }
}