import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart' as mem;
import 'ktp_popup.dart';
import 'payment_popup.dart';
import 'database_bukti_list.dart';

class DatabaseList extends StatefulComponent {
  const DatabaseList({super.key});

  @override
  State createState() => _DatabaseListState();
}

class _DatabaseListState extends State<DatabaseList> {
  final client = mem.Client('http://localhost:8080/');

  List<mem.Member> memberList = [];
  bool isLoading = false;

  // State untuk KTP Popup
  bool isKtpPopupVisible = false;
  String? selectedKtpUrl;

  // State untuk Payment Popup
  bool isPaymentPopupVisible = false;
  List<String> selectedPaymentUrls = [];
  int currentPaymentIndex = 0; // untuk carousel

  // State untuk Edit Bukti (menampilkan DatabaseBuktiList)
  bool isEditBuktiVisible = false;
  mem.Member? selectedMemberForBukti;

  @override
  void initState() {
    super.initState();
    fetchMembers();
  }

  Future<void> fetchMembers() async {
    setState(() => isLoading = true);
    try {
      final members = await client.member.getAllMembers();
      setState(() {
        memberList = members;
      });
    } catch (e) {
      print('Error fetching members: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void openKtpPopup(String? ktpUrl) {
    if (ktpUrl == null) return;
    setState(() {
      selectedKtpUrl = ktpUrl;
      isKtpPopupVisible = true;
    });
  }

  void closeKtpPopup() {
    setState(() => isKtpPopupVisible = false);
  }

  void openPaymentPopup(mem.Member member) {
    // Di sini Anda perlu fetch data bukti pembayaran dari DatabaseMember
    // misalnya getDatabaseMemberByPelangganId
    // lalu simpan URL-url ke selectedPaymentUrls
    setState(() {
      selectedPaymentUrls = [
        // Contoh data statis
        // Nanti ganti dengan data real dari API
        'https://s3.nevaobjects.id/app-membership-01/payment1.png',
        'https://s3.nevaobjects.id/app-membership-01/payment2.png',
      ];
      currentPaymentIndex = 0;
      isPaymentPopupVisible = true;
    });
  }

  void closePaymentPopup() {
    setState(() => isPaymentPopupVisible = false);
  }

  void openEditBukti(mem.Member member) {
    setState(() {
      selectedMemberForBukti = member;
      isEditBuktiVisible = true;
    });
  }

  void closeEditBukti() {
    setState(() => isEditBuktiVisible = false);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    if (isLoading) {
      yield div([text('Memuat data...')]);
      return;
    }

    if (isKtpPopupVisible && selectedKtpUrl != null) {
      yield KtpPopup(
        ktpUrl: selectedKtpUrl!,
        onClose: closeKtpPopup,
      );
    }

    if (isPaymentPopupVisible) {
      yield PaymentPopup(
        paymentUrls: selectedPaymentUrls,
        currentIndex: currentPaymentIndex,
        onClose: closePaymentPopup,
      );
    }

    if (isEditBuktiVisible && selectedMemberForBukti != null) {
      yield DatabaseBuktiList(
        member: selectedMemberForBukti!,
        onClose: closeEditBukti,
      );
    }
    else{
      yield table(classes: 'database-table', [
        thead([
          tr([
            th([text('MEMBER')]),
            th([text('NIK')]),
            th([text('No. WhatsApp')]),
            th([text('KTP')]),
            th([text('BUKTI PEMBAYARAN')]),
          ]),
        ]),
        tbody([
          for (final member in memberList)
            tr([
              td([text(member.namaPelanggan)]),
              td([text(member.nik.toString())]),
              td([text(member.noWhatsapp)]),
              td([
                if (member.ktp != null)
                  img(
                    src: member.ktp!,
                    alt: 'KTP',
                    classes: 'ktp-image',
                    events: {
                      'click': (_) => openKtpPopup(member.ktp),
                    },
                  )
                else
                  div([text('KTP Tidak Ada')]),
              ]),
              td([
                button(
                  classes: 'lihat-bukti-button',
                  onClick: () => openPaymentPopup(member),
                  [text('LIHAT BUKTI')],
                ),
                button(
                  classes: 'edit-bukti-button',
                  onClick: () => openEditBukti(member),
                  [text('EDIT BUKTI')],
                ),
              ]),
            ]),
        ]),
      ]);
    }
  }
}
