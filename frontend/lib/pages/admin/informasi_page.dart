import 'package:frontend/services/profile_service.dart';
import 'package:jaspr/jaspr.dart';
import 'package:membership_app_client/membership_app_client.dart';
import '../../components/admin/admin_layout.dart';
import '../../components/admin/information_list.dart';
import '../../components/admin/information_form.dart';
import '../../components/admin/information_delete_popup.dart';
@client
class InformationPage extends StatefulComponent {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}
  
class _InformationPageState extends State<InformationPage>{
  final client = Client('http://localhost:8080/'); // Ganti dengan URL server Anda4

  @override
  void initState() {
    super.initState();
    print("[CLIENT InformationPage] initState: Calling fetchUserProfile...");
    ProfileService.instance.fetchUserProfile(); // Ambil profil pengguna
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield AdminLayout(
      child: div(classes: 'information-page', attributes: {'data-view': 'list'}, [
        // DomComponent(
        //   tag: 'script',
        //   attributes: {'src': '/scripts/info-handler.js'}, // JavaScript untuk interaksi
        // ),
        h1([text('Informasi')]),
        InformationList(), // Komponen List
        // InformationForm(), // Komponen Form
        // InformationDeletePopup(), // Komponen Delete Popup
      ]),
    );
  }
}
