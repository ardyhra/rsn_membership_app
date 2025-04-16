import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/database_list.dart';
import '../../services/profile_service.dart'; // Import ProfileService
@client
class DatabasePage extends StatefulComponent {
  const DatabasePage({super.key});

  @override
    State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  final client = Client('http://localhost:8080/'); // Ganti dengan URL server Anda

  @override
  void initState() {
    super.initState();
    print("[CLIENT DatabasePage] initState: Calling fetchUserProfile...");
    ProfileService.instance.fetchUserProfile(); // Ambil profil pengguna
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // AdminLayout sebagai layout utama
    yield AdminLayout(
      child: div(
        classes: 'database-page',
        attributes: {'data-view': 'list'},
        [
          h1([text('Database Bukti Member')]),
          // Container utama, menampung DatabaseList
          DatabaseList(),
        ],
      ),
    );
  }
}
