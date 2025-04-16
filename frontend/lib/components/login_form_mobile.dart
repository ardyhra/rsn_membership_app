import 'package:universal_html/html.dart' as html;
import 'package:jaspr/jaspr.dart';

class LoginFormMobile extends StatefulComponent {
  const LoginFormMobile({super.key});

  @override
  State createState() => _LoginFormMobileState();
}

class _LoginFormMobileState extends State<LoginFormMobile> {
  bool _isPasswordVisible = false;
  String _username = '';
  String _password = '';

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _handleLogin() {
    if (_username.isEmpty || _password.isEmpty) {
      html.window.alert('Username and Password are required!');
      return;
    }

    if (_username == 'admin' && _password == 'admin123') {
      html.window.location.href = '/dashboard';
    } else if (_username == 'member' && _password == 'member123') {
      html.window.location.href = '/mobile-beranda';
    } else if (_username == 'sales' && _password == 'sales123') {
      html.window.location.href = '/sales-beranda';
    } else {
      html.window.alert('Invalid Username or Password!');
    }

    print({
      'username': _username,
      'password': '********',
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'login-page-mobile', [
      img(src: '/images/logo.png', alt: 'Logo', classes: 'logo-mobile'),
      h1([text('Masuk ke Dashboard')]),
      div(classes: 'form-group-mobile', [
        label([text('ID')]),
        input(
          [],
          type: InputType.text,
          attributes: {'id': 'username-mobile', 'placeholder': 'Masukkan username anda'},
          events: {
            'input': (event) {
              final target = event.target as html.InputElement;
              setState(() => _username = target.value ?? '');
            },
          },
        ),
      ]),
      div(classes: 'form-group-mobile', [
        label([text('Password')]),
        div(classes: 'password-container', [
          input(
            [],
            type: _isPasswordVisible ? InputType.text : InputType.password,
            attributes: {'id': 'password-mobile', 'placeholder': 'Masukkan password'},
            events: {
              'input': (event) {
                final target = event.target as html.InputElement;
                setState(() => _password = target.value ?? '');
              },
            },
          ),
          button(
            classes: 'password-toggle',
            events: {'click': (_) => _togglePasswordVisibility()},
            attributes: {'type': 'button'},
            [
              img(
                src: _isPasswordVisible ? '/images/eye-open.png' : '/images/eye-closed.png',
                alt: 'Toggle Password Visibility',
                classes: 'toggle-icon',
              ),
            ],
          ),
        ]),
      ]),
      button(
        classes: 'login-button',
        events: {'click': (_) => _handleLogin()},
        attributes: {'id': 'login-button-mobile'},
        [text('Masuk')],
      ),
      img(
        src: '/images/footer-login-mobile.png',
        alt: 'Footer Illustration',
        classes: 'footer-illustration',
      ),
    ]);
  }
}