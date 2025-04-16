// In frontend/lib/components/login_form_desktop.dart
import 'package:universal_html/html.dart' as html;
import 'package:jaspr/jaspr.dart';
// Import the Serverpod client library and protocol
// Ensure AuthResponse and AkunInfo are generated in the client library
import 'package:membership_app_client/membership_app_client.dart';

@client // Ensure this component runs on the client
class LoginFormDesktop extends StatefulComponent {
  const LoginFormDesktop({super.key});

  @override
  State createState() => _LoginFormDesktopState();
}

class _LoginFormDesktopState extends State<LoginFormDesktop> {
  // Client setup
  final client = Client('http://localhost:8080/'); // Use your server URL

  // State variables
  bool _isPasswordVisible = false;
  String _username = '';
  String _password = '';
  bool _rememberPassword = false;
  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  // Key for storing the JWT token in localStorage
  // IMPORTANT: Use the same key consistently across your app (login, logout, protected calls)
  static const String _jwtTokenStorageKey = 'jwt_token';

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  // Updated login handler for JWT
  Future<void> _handleLogin() async {
    print('Login button clicked!');
    _successMessage = null; // Clear previous success message
    if (_username.isEmpty || _password.isEmpty) {
      setState(() { _errorMessage = 'Username and Password are required!'; });
      Future.delayed(Duration(seconds: 4), () {
        if (mounted) { setState(() { _errorMessage = null; }); }
      });
      return;
    }

    setState(() { _isLoading = true; _errorMessage = null; });

    try {
      // Call the signIn endpoint which now returns AuthResponse with JWT in 'key'
      final AuthResponse authResponse = await client.auth.signIn(
        username: _username,
        password: _password,
      );

      if (authResponse.success && authResponse.key != null && authResponse.akunInfo != null) {
        // Login Successful! The key is the JWT token.
        final jwtToken = authResponse.key!; // Extract JWT token
        final userInfo = authResponse.akunInfo!;
        print('Login successful for user: ${userInfo.username}, role: ${userInfo.role}');
        print('Received JWT (truncated): ${jwtToken.length > 10 ? jwtToken.substring(0, 10) : jwtToken}...');

        // --- Store the JWT token in localStorage ---
        // WARNING: localStorage is accessible via JavaScript (XSS vulnerability).
        // For higher security, research httpOnly cookies (more complex setup).
        try {
          html.window.localStorage[_jwtTokenStorageKey] = jwtToken; // Store JWT
          // *** ADD THIS LOG ***
          var storedValue = html.window.localStorage[_jwtTokenStorageKey];
          print('Token stored in localStorage. Key: $_jwtTokenStorageKey. Value retrieved immediately: ${storedValue?.substring(0, 10)}...');
          if (storedValue != jwtToken) {
            print('WARNING: Value retrieved from localStorage differs immediately after setting!');
          }
          // *** END LOG ***
        } catch (e) {
          print('Error storing token in localStorage: $e');
          setState(() { _errorMessage = 'Login ok, but failed to save session locally.'; });
          // Consider stopping here if local storage is critical
          setState(() => _isLoading = false); // Stop loading indicator
          return; // Halt if token can't be stored
        }
        // --- End Token Storage ---

        setState(() { _successMessage = authResponse.message ?? 'Login berhasil!'; });

        // Delay redirect to show success message
        
          // Redirect based on role from AkunInfo
          switch (userInfo.role.toLowerCase()) {
            case 'admin': html.window.location.href = '/dashboard'; break;
            case 'member': html.window.location.href = '/mobile-beranda'; break;
            case 'sales': html.window.location.href = '/sales-beranda'; break;
            default: html.window.location.href = '/';
          }
      

      } else {
        // Login Failed on server (invalid credentials or server error)
        setState(() {
          _errorMessage = authResponse.message ?? 'Invalid Username or Password!';
          _successMessage = null;
        });
        Future.delayed(Duration(seconds: 4), () {
          if (mounted) { setState(() { _errorMessage = null; }); }
        });
      }
    } catch (e) {
      // Network error or other exception during client call
      print('Login error: $e');
      setState(() {
        _errorMessage = 'An error occurred during login: $e'; // Show specific error if helpful
        _successMessage = null;
      });
       Future.delayed(Duration(seconds: 4), () {
         if (mounted) { setState(() { _errorMessage = null; }); }
       });
    } finally {
      // Reset loading state only if not redirecting immediately or if login failed
      // The redirect happens after a delay, so we can reset loading here.
      if (mounted) {
        setState(() { _isLoading = false; });
      }
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // Yield UI elements (Inputs, Buttons) - use state variables correctly
    yield div(classes: 'login-container', [
      img(src: '/images/logo.png', alt: 'Logo', classes: 'logo'),
      h1([text('Masuk ke Dashboard')]),
      p([text('Please enter your email and password to continue')]),

      // Display Error/Success Messages
      if (_errorMessage != null)
        p([text(_errorMessage!)], classes: 'notif error'),
      if (_successMessage != null)
        p([text(_successMessage!)], classes: 'notif success'),

      // Form elements
      div(classes: 'form-group', [
         label([text('Id :')]),
         input(
           [],
           type: InputType.text,
           attributes: {'id': 'username', 'placeholder': 'Admin12345'},
           events: {'input': (event) { final target = event.target as html.InputElement; setState(() => _username = target.value ?? ''); }},
           disabled: _isLoading,
         ),
      ]),
       div(classes: 'form-group', [
         label([text('Password')]),
         div(classes: 'password-container', [
           input(
              [],
              type: _isPasswordVisible ? InputType.text : InputType.password,
              attributes: {'id': 'password', 'placeholder': '******'},
              events: {'input': (event) { final target = event.target as html.InputElement; setState(() => _password = target.value ?? ''); }},
              disabled: _isLoading,
           ),
           button(
              classes: 'password-toggle', events: {'click': (_) => _togglePasswordVisibility()}, attributes: {'type': 'button'},
              [ img(src: _isPasswordVisible ? '/images/eye-open.png' : '/images/eye-closed.png', alt: 'Toggle Password Visibility', classes: 'toggle-icon') ],
              disabled: _isLoading,
           ),
         ]),
      ]),
       div(classes: 'form-group remember-password', [
          input(
             [], type: InputType.checkbox, attributes: {'id': 'remember-password'},
             events: {'change': (event) { final target = event.target as html.InputElement; setState(() => _rememberPassword = target.checked ?? false); }},
             disabled: _isLoading,
          ),
          span([text('Remember Password')]),
       ]),
       button(
         classes: 'login-button', events: {'click': (_) => _handleLogin()}, attributes: {'id': 'login-button'},
         [text(_isLoading ? 'Logging in...' : 'Masuk')],
         disabled: _isLoading,
       ),
    ]);
  }
}