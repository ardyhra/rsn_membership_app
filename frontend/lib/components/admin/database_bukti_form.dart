import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;

class DatabaseBuktiForm extends StatefulComponent {
  final bool isAdd;
  final mem.Member member;
  final mem.DatabaseMember? bukti;
  final VoidCallback onClose;

  const DatabaseBuktiForm({
    required this.isAdd,
    required this.member,
    this.bukti,
    required this.onClose,
    super.key,
  });

  @override
  State<StatefulComponent> createState() => _DatabaseBuktiFormState();
}

class _DatabaseBuktiFormState extends State<DatabaseBuktiForm> {
  final client = mem.Client('http://localhost:8080/');

  bool isLoading = false;
  String? fotoUrl;
  String keterangan = '';

  @override
  void initState() {
    super.initState();
    if (!component.isAdd && component.bukti != null) {
      fotoUrl = component.bukti!.buktiPembayaran;
      keterangan = component.bukti!.keterangan;
    }
  }

  Future<void> submitForm() async {
    setState(() => isLoading = true);
    try {
      if (component.isAdd) {
        // Add DatabaseMember
        final newBukti = mem.DatabaseMember(
          buktiPembayaran: fotoUrl??'Tidak ada foto',
          keterangan: keterangan,
          pelangganId: component.member.id!,
        );
        final success = await client.databaseMember.addDatabaseMember(newBukti);
        // handle success/failure
      } else {
        // Update DatabaseMember
        final updatedBukti = component.bukti!.copyWith(
          buktiPembayaran: fotoUrl,
          keterangan: keterangan,
        );
        final success = await client.databaseMember.updateDatabaseMember(updatedBukti);
        // handle success/failure
      }
      component.onClose();
    } catch (e) {
      print('Error submitForm: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (isLoading) {
      yield div([text('Menyimpan data...')]);
      return;
    }

    yield div(classes: 'database-bukti-form', [
      h3([text(component.isAdd ? 'Tambah Bukti' : 'Edit Bukti')]),
      // Foto URL / Preview?
      div(classes: 'form-group', [
        label([text('Foto Bukti')]),
        if (fotoUrl != null)
          img(
            src: fotoUrl!,
            alt: 'Foto Bukti',
            classes: 'bukti-image-preview',
          )
        else
          div([text('Belum ada foto')]),

        // Tombol upload? Mirip promptUploadKTP
        // ...
      ]),

      // Keterangan
      div(classes: 'form-group', [
        label([text('Keterangan')]),
        textarea(
          [],
          attributes: {'value': keterangan},
          onInput: (val) => setState(() => keterangan = val),
        ),
      ]),

      // Tombol
      div(classes: 'form-actions', [
        button(
          classes: 'save-button',
          onClick: submitForm,
          [text('Simpan')],
        ),
        button(
          classes: 'cancel-button',
          onClick: component.onClose,
          [text('Batal')],
        ),
      ]),
    ]);
  }
}
