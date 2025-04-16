import 'package:jaspr/jaspr.dart';
import 'sidebar.dart';
import 'navbar.dart';
import '../../services/profile_service.dart'; // Import ProfileService
class AdminLayout extends StatelessComponent {
  final Component child;
  const AdminLayout({required this.child, super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield StreamBuilder<ProfileState>(
      stream: ProfileService.instance.profileStateStream,
      initialData: ProfileService.instance.currentInitialState,
      builder: (context, snapshot) sync* {
        final state = snapshot.data!;
        if (state.isLoading) { /* Show Loading */ return; }
        if (!state.isLoggedIn) { /* Show Auth Error / Redirect */ return; }

        // Render layout IF loading done AND logged in
        yield div(classes: 'admin-layout', [
          const Sidebar(),
          div(classes: 'content-area', [
            DomComponent(tag: 'script', /* ... */),
            const Navbar(), // Navbar gets title from service itself
            div(classes: 'page-content', [child]), // Render the actual page
          ]),
        ]);
      }
    );
  }

  @css
  static final styles = [
    css('.admin-layout', [
      css('&').flexbox(direction: FlexDirection.row).box(height: 100.vh),
      css('.content-area').flexItem(flex: const Flex(grow: 1)).flexbox(direction: FlexDirection.column),
      css('.page-content').flexItem(flex: const Flex(grow: 1)).box(padding: EdgeInsets.all(16.px)),
    ]),
  ];
}
