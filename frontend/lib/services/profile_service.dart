// In frontend/lib/services/profile_service.dart

import 'dart:async';
import 'package:universal_html/html.dart' as html;
import 'package:membership_app_client/membership_app_client.dart';
// *** Import JWT decoding library ***
import 'package:jose/jose.dart'; // Or your chosen JWT library for Dart web

const String _jwtTokenStorageKey = 'jwt_token';

// ProfileState class remains the same
class ProfileState {
  final bool isLoading;
  final bool isLoggedIn;
  final String navbarTitle;
  // Keep UserProfile? null or remove if not needed by any component directly
  final UserProfile? userProfile; // Or maybe just AkunInfo? Or remove? Let's keep it null for now.

  ProfileState({
    this.isLoading = false,
    this.isLoggedIn = false,
    this.navbarTitle = 'Loading...',
    this.userProfile, // Default to null
  });
}

class ProfileService {
  static final ProfileService instance = ProfileService._internal();
  ProfileService._internal();

  final Client client = Client('http://localhost:8080/');

  final StreamController<ProfileState> _profileStateController = StreamController<ProfileState>.broadcast();
  ProfileState _currentState = ProfileState();
  ProfileState get currentInitialState => _currentState;
  Stream<ProfileState> get profileStateStream => _profileStateController.stream;

  // fetchUserProfile now decodes JWT and calls specific endpoint
   Future<void> fetchUserProfile() async {
    print("[ProfileService] fetchUserProfile STARTING."); // 1. Check Start

    // // Avoid starting if already loading (keep this check)
    // if (_currentState.isLoading) {
    //   print("[ProfileService] Already loading state detected, returning.");
    //   return;
    // }
    // Set loading state *immediately*
    // *** ADD THIS CHECK ***
    // If we are not currently loading AND we are already logged in,
    // assume the profile is current and don't re-fetch.
    if (!_currentState.isLoading && _currentState.isLoggedIn) {
        print("[ProfileService] Profile already loaded and user logged in. Skipping fetch.");
        // Optional: Re-emit current state if needed by listeners expecting an emission on call
        // _profileStateController.add(_currentState);
        return;
    }
    _updateState(isLoading: true, navbarTitle: 'Loading...', userProfile: null, isLoggedIn: false);

    String? jwtToken;
    Map<String, dynamic>? claims;
    String? bearerTokenArg;
    bool loggedInSuccessfully = false;
    String finalTitle = 'Error'; // Default to Error
    UserProfile? finalUserProfile = null; // Keep null as we fetch parts

    try {
      // 2. Check Token Retrieval
      jwtToken = html.window.localStorage[_jwtTokenStorageKey];
      print("[ProfileService] Token from localStorage: ${jwtToken == null ? 'NULL' : 'FOUND'}");
      if (jwtToken == null || jwtToken.isEmpty) throw Exception("No token found in storage.");
      bearerTokenArg = 'Bearer $jwtToken';

      // 3. Check JWT Decoding
      var jsonWebToken = JsonWebToken.unverified(jwtToken);
      claims = jsonWebToken.claims.toJson();
      final String? role = claims?['rol'] as String?;
      final dynamic relatedIdRaw = claims?['rel'];
      final int? relatedId = (relatedIdRaw is int) ? relatedIdRaw : null;
      final String? usernameFallback = claims?['username'] as String?;
      print("[ProfileService] JWT Decoded: Role=$role, RelatedID=$relatedId, Username=$usernameFallback");

      if (role == null) throw Exception("Role missing in JWT payload.");

      finalTitle = usernameFallback ?? 'User'; // Set fallback early

      // 4. Check Before API Call (if applicable)
      if (relatedId != null) {
          dynamic profileData;
          String specificName = finalTitle;

          // 5. Check Specific API Call
          print("[ProfileService] Preparing to call endpoint for Role: $role, ID: $relatedId");
          try {
            switch (role.toLowerCase()) {
              case 'admin':
                profileData = await client.admin.getAdminById(relatedId, bearerToken: bearerTokenArg);
                print("[ProfileService] getAdminById returned: ${profileData?.toString() ?? 'null'}"); // Log result
                if (profileData is Admin && profileData.namaAdmin.isNotEmpty) {
                  specificName = profileData.namaAdmin;
                } else if (profileData == null) { print("[ProfileService] WARNING: Admin profile null for relatedId $relatedId"); }
                break;
              // case 'member': ... // Add logging inside these too if implemented
              // case 'sales': ...
              default:
                print("[ProfileService] Unhandled role '$role'.");
            }
            finalTitle = specificName; // Update title
            loggedInSuccessfully = true; // API call structure succeeded
            print("[ProfileService] Title after API call/check: $finalTitle"); // 6. Check Title after API logic

          } catch (apiError) {
              print("[ProfileService] ERROR calling role-specific endpoint ($role, ID $relatedId): $apiError");
              finalTitle = usernameFallback ?? 'Error API'; // Fallback on API error
              loggedInSuccessfully = true; // Token was okay, maybe API is down? Or unauthorized? Still logged in at JWT level.
          }
      } else {
           print("[ProfileService] No relatedId for role '$role', using username.");
           finalTitle = usernameFallback ?? 'User';
           loggedInSuccessfully = true; // Logged in based on valid JWT
      }

    } catch (e) {
        print("[ProfileService] ERROR processing token or other setup: $e");
        finalTitle = 'Processing Error';
        loggedInSuccessfully = false;
        // Trigger logout only if error is critical (like invalid token)
        // logout(); // Consider if logout is needed here
    } finally {
        // 7. Check FINAL state before update
        print("[ProfileService] FINALLY block. Updating state with: isLoading=false, isLoggedIn=$loggedInSuccessfully, title=$finalTitle");
        _updateState(
            isLoading: false,
            isLoggedIn: loggedInSuccessfully,
            navbarTitle: finalTitle,
            userProfile: null // Not fetching combined profile here
        );
    }
    print("[ProfileService] fetchUserProfile FINISHED."); // 8. Check End
  }


  void logout() {
     print('[ProfileService] Logging out.');
     try { html.window.localStorage.remove(_jwtTokenStorageKey); } catch (_) {}
     _updateState(isLoading: false, isLoggedIn: false, navbarTitle: '', userProfile: null);
     html.window.location.href = '/login';
  }

  void _updateState({bool? isLoading, bool? isLoggedIn, String? navbarTitle, UserProfile? userProfile}) {
      _currentState = ProfileState(
          isLoading: isLoading ?? _currentState.isLoading,
          isLoggedIn: isLoggedIn ?? _currentState.isLoggedIn,
          navbarTitle: navbarTitle ?? _currentState.navbarTitle,
          userProfile: userProfile // Keep null if not fetching combined profile
      );
      print("[ProfileService] _updateState: Prepared new state: isLoading=${_currentState.isLoading}, isLoggedIn=${_currentState.isLoggedIn}, title=${_currentState.navbarTitle}");
      if (!_profileStateController.isClosed) {
          _profileStateController.add(_currentState);
           print("[ProfileService] New state added to stream: isLoading=${_currentState.isLoading}, isLoggedIn=${_currentState.isLoggedIn}, title=${_currentState.navbarTitle}");
      } else { print("[ProfileService] Stream controller closed."); }
  }

  void dispose() {
     _profileStateController.close();
  }
}