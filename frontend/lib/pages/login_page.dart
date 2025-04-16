import 'package:universal_html/html.dart' as html; // Untuk manipulasi DOM dan redirect
import 'package:jaspr/jaspr.dart';
import 'package:frontend/components/login_form_desktop.dart';
import 'package:frontend/components/login_form_mobile.dart';

@client
class LoginPage extends StatefulComponent {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isMobile = false;

  @override
  void initState() {
    super.initState();
    var userAgent = html.window.navigator.userAgent;
    _isMobile = userAgent.contains(RegExp(r'Mobi|Android|iPhone', caseSensitive: false));
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'login-page', attributes: {'data-device': _isMobile ? 'mobile' : 'desktop'}, [
      if (_isMobile)
        LoginFormMobile()
      else
        LoginFormDesktop(),
    ]);
  }
}