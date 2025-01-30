import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart'; // Generated by Serverpod
import '../../components/admin/admin_layout.dart';
import '../../components/admin/member_list_component.dart';
import '../../components/admin/member_verification_component.dart';

@client
class MemberPage extends StatefulComponent {
  const MemberPage({super.key});

  @override
  State createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final client = Client('http://localhost:8080/');

  List<Member> memberList = [];
  List<Member> filteredList = [];
  List<Sales> salesList = [];
  bool isLoading = true;
  bool isVerificationMode = false;
  Member? selectedMember;
  String? notificationMessage;
  bool isNotificationSuccess = true;
  String searchQuery = '';
  String currentFilter = 'Semua';

   // State sorting
  String currentSortColumn = 'namaPelanggan';
  bool isSortAscending = true;

   List<Member> applyFiltersAndSorting(List<Member> members) {
    // Terapkan filter
    final filtered = members.where((member) {
      final matchesSearch = searchQuery.isEmpty ||
          member.namaPelanggan.toLowerCase().contains(searchQuery.toLowerCase()) ||
          member.nik.toString().contains(searchQuery) ||
          member.noWhatsapp.contains(searchQuery);

      final matchesFilter = currentFilter == 'Semua' ||
          (currentFilter == 'Valid' && member.status == 'Valid') ||
          (currentFilter == 'Belum Valid' && member.status != 'Valid');

      return matchesSearch && matchesFilter;
    }).toList();

    // Terapkan sorting
    filtered.sort((a, b) {
      int compare;
      switch (currentSortColumn) {
        case 'namaPelanggan':
          compare = a.namaPelanggan.compareTo(b.namaPelanggan);
          break;
        case 'nik':
          compare = a.nik.compareTo(b.nik);
          break;
        case 'noWhatsapp':
          compare = a.noWhatsapp.compareTo(b.noWhatsapp);
          break;
        default:
          return 0;
      }
      return isSortAscending ? compare : -compare;
    });

    return filtered;
  }

  void sortTable(String column) {
    setState(() {
      if (currentSortColumn == column) {
        isSortAscending = !isSortAscending; // Toggle arah sorting
      } else {
        currentSortColumn = column; // Ganti kolom sorting
        isSortAscending = true; // Reset ke ascending
      }
      filteredList = applyFiltersAndSorting(memberList); // Terapkan ulang filter dan sorting
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMembers();
  }

  Future<void> fetchMembers() async {
    setState(() {
      isLoading = true;
    });

    try {
      final data = await client.member.getAllMembers();
      final fetchedSales = await client.sales.getAllSales();
      setState(() {
        memberList = data;
        salesList = fetchedSales;
        filteredList = filterMembers(data);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showNotification('Gagal mengambil data member: $e', false);
    }
  }

  List<Member> filterMembers(List<Member> members) {
    return members.where((member) {
      final matchesSearch = searchQuery.isEmpty ||
          member.namaPelanggan.toLowerCase().contains(searchQuery.toLowerCase()) ||
          member.nik.toString().contains(searchQuery) ||
          member.noWhatsapp.contains(searchQuery);

      final matchesFilter = currentFilter == 'Semua' ||
          (currentFilter == 'Valid' && member.status == 'Valid') ||
          (currentFilter == 'Belum Valid' && member.status != 'Valid');

      return matchesSearch && matchesFilter;
    }).toList();
  }

  void handleSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredList = filterMembers(memberList);
    });
  }


  void handleFilter(String filter) {
    setState(() {
      currentFilter = filter;
      filteredList = filterMembers(memberList);
    });
  }

  void showNotification(String message, bool isSuccess) {
    setState(() {
      notificationMessage = message;
      isNotificationSuccess = isSuccess;
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        notificationMessage = null;
      });
    });
  }

  void goToVerification(Member member) {
    setState(() {
      selectedMember = member;
      isVerificationMode = true;
    });
  }

  void goToList() {
    setState(() {
      isVerificationMode = false;
      selectedMember = null;
    });
  }

  Future<void> verifyMember(Member updatedMember) async {
    try {
      await client.member.updateMember(updatedMember);
      showNotification('Berhasil mengupdate verifikasi member.', true);
      fetchMembers(); // Reload data setelah verifikasi
      goToList(); // Kembali ke tampilan daftar
    } catch (e) {
      showNotification('Gagal memverifikasi member: $e', false);
    }
  }


  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'member-page', [
        h1([text('Data Member')]),
        // Notifikasi
        if (notificationMessage != null)
          div(
            classes: isNotificationSuccess ? 'notif success' : 'notif error',
            [text(notificationMessage!)],
          ),

        // Loading
        if (isLoading)
          div([text('Memuat data member...')])
        else if (isVerificationMode && selectedMember != null)
          MemberVerificationComponent(
            member: selectedMember!,
            salesList: salesList, // Pass daftar sales ke komponen
            onVerify: verifyMember,
            onCancel: goToList,
            showNotification: showNotification, // Tambahkan ini
          )
        else
          div([
            // Header pencarian
            div(classes: 'header-with-search', [
              input(
                [],
                type: InputType.text,
                attributes: {'placeholder': 'Cari member...'},
                classes: 'search-input',
                onInput: (event) => handleSearch(event.toString()),
              ),
            ]),

            // Filter tombol
            div(classes: 'formulir-filter-buttons', [
              for (final filter in ['Semua', 'Valid', 'Belum Valid'])
                button(
                  classes: 'formulir-filter-button${currentFilter == filter ? ' active' : ''}',
                  onClick: () => handleFilter(filter),
                  [text(filter)],
                ),
            ]),

            // Daftar Member
            MemberListComponent(
              members: filteredList,
              onSelect: goToVerification,
              searchQuery: searchQuery, // Tambahkan ini
              currentFilter: currentFilter, // Tambahkan ini
              onSort: sortTable, // Berikan fungsi sorting
              currentSortColumn: currentSortColumn,
              isSortAscending: isSortAscending,
            ),
          ]),
      ]),
    );
  }

}
