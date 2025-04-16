// In frontend/lib/components/admin/navbar.dart

import 'package:jaspr/jaspr.dart';
import '../../services/profile_service.dart'; // Import the service for logout

// Key for JWT Token storage (if needed for logout directly, though service handles it)
// const String _jwtTokenStorageKey = 'jwt_token';

@client // Navbar is stateful and handles clicks/streams client-side
class Navbar extends StatefulComponent {
  // No 'title' parameter needed, reads from service via StreamBuilder
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isLoggingOut = false;
  // --- State for Dropdown ---
  bool _isDropdownOpen = false; // Track if the dropdown is visible

  // --- Toggle Dropdown Method ---
  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
      print("Dropdown toggled: $_isDropdownOpen"); // Debug log
    });
  }

  // Logout handler remains the same
  Future<void> _handleLogout() async {
    if (_isLoggingOut) return;
    setState(() => _isLoggingOut = true);
    ProfileService.instance.logout();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield StreamBuilder<ProfileState>(
      stream: ProfileService.instance.profileStateStream,
      initialData: ProfileService.instance.currentInitialState,
      builder: (context, snapshot) sync* {
        final state = snapshot.data!;
        final title = state.navbarTitle;

        yield header(classes: 'navbar', [
          div(classes: 'title-section', [
             h3([text('Selamat Datang,')]),
             h2([text(title)]),
          ]),
          div(classes: 'navbar-actions', [
            div(classes: 'notification', [
              img(src: '/images/notification-icon.png', alt: 'Notification'),
              span(classes: 'badge', [text('6')]),
            ]),
            // --- Profile Area ---
            // Add a relative position if dropdown is absolute positioned
            div(classes: 'profile', [
              img(src: '/images/profile.png', classes: 'profile-pic', alt: 'Profile'),
              span([text(title)]),
              // --- Attach click listener to the icon ---
              img(
                  src: '/images/dropdown-icon.png',
                  alt: 'Dropdown',
                  classes: 'dropdown-icon',
                  // Add click event to toggle the state
                  events: {'click': (_) => _toggleDropdown()},
                
              ),
              // --- End Icon ---

              // --- Dropdown Menu ---
              // Conditionally add 'active' class based on state
              div(classes: 'dropdown-menu ${_isDropdownOpen ? 'active' : ''}', [
                button(
                  classes: 'dropdown-item logout-button',
                  events: {'click': (_) => _handleLogout()},
                  disabled: _isLoggingOut,
                  [text(_isLoggingOut ? 'Logging out...' : 'Logout')],
                ),
              ]),
              // --- End Dropdown Menu ---
            ]),
            // --- End Profile Area ---
          ]),
        ]);
      },
    );
  }
}