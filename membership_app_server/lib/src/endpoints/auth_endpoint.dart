// In my_project_server/lib/src/endpoints/auth_endpoint.dart

import 'package:crypt/crypt.dart';           // For password checking
import 'package:serverpod/serverpod.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart'; // For JWT handling
import '../generated/protocol.dart';       // Includes Akun, AuthResponse, AkunInfo

class AuthEndpoint extends Endpoint {

  // --- Configuration ---
  // Name of the key in generator.yaml/config/*.yaml under 'passwords:' section
  static const String _jwtSecretKeyName = 'jwtSecret';
  // Duration for which the JWT token should be valid
  static const Duration _tokenValidityDuration = Duration(days: 1); // Example: 1 day

  // --- Sign In ---
  // Verifies credentials and returns an AuthResponse containing a JWT token.
  @override
  Future<AuthResponse> signIn(Session session, {required String username, required String password}) async {
    Akun? akun = await Akun.db.findFirstRow(
      session,
      where: (t) => t.username.equals(username),
    );

    if (akun == null) {
      session.log('Login failed: User not found ($username)', level: LogLevel.info);
      return AuthResponse(success: false, message: 'Invalid username or password.');
    }

    // Verify password using the stored hash
    if (Crypt(akun.password).match(password)) {
      // Password matches! Generate JWT.
      session.log('Login credentials valid for user ($username, ID: ${akun.id})', level: LogLevel.info);

      try {
        session.log('Attempting JWT generation for user ID ${akun.id}.', level: LogLevel.debug);

        // *** ADD THIS LOGGING ***
        print('[DEBUG] Inside signIn - Checking Password Configuration');
        print('[DEBUG] Run Mode from Serverpod.instance: ${Serverpod.instance.runMode}');
        print('[DEBUG] Attempting to get password for key: $_jwtSecretKeyName');

        // The critical call
        final String? secret = Serverpod.instance.getPassword(_jwtSecretKeyName);

        print('[DEBUG] Result of getPassword("$_jwtSecretKeyName"): ${secret == null ? "NULL" : (secret.isEmpty ? "EMPTY STRING" : "Value Present (length ${secret.length})")}');
        // *** END LOGGING ***
        if (secret == null || secret.isEmpty) {
          session.log('FATAL: JWT Secret Key "$_jwtSecretKeyName" is not configured in passwords section!', level: LogLevel.error);
          return AuthResponse(success: false, message: 'Internal server configuration error.');
        }
        // Optional: Add length check for production secrets
        if (secret.length < 32 && session.serverpod.runMode == 'production') {
            session.log('WARNING: Production JWT secret key is less than 32 characters, which is potentially insecure.', level: LogLevel.warning);
        }

        // --- Generate JWT ---
        final issuedAt = DateTime.now();
        final expiresAt = issuedAt.add(_tokenValidityDuration);

        final payload = <String, dynamic>{
          'sub': akun.id!, // Subject (standard claim for user ID)
          'rol': akun.role, // Custom claim for role
          'rel': akun.relatedId,   // *** ADDED: The ID linking to Admin/Member/Sales table ***
          'username': akun.username, // Custom claim for username
          'iat': issuedAt.millisecondsSinceEpoch ~/ 1000, // Issued at (standard claim)
          'exp': expiresAt.millisecondsSinceEpoch ~/ 1000, // Expiration time (standard claim)
          // Add other non-sensitive claims if needed
        };
        final jwt = JWT(payload);
        final token = jwt.sign(SecretKey(secret)); // Sign with your secret key
        // --- End JWT Generation ---

        session.log('JWT generated successfully for user ID ${akun.id}', level: LogLevel.info);

        // Prepare safe user info to return
        final akunInfo = AkunInfo(
          id: akun.id!,
          relatedId: akun.relatedId,
          username: akun.username,
          email: akun.email,
          role: akun.role,
        );

        // Return success, info, and the JWT token string
        return AuthResponse(
          success: true,
          akunInfo: akunInfo,
          key: token, // Send the JWT token string
          message: 'Login successful.'
        );

      } catch (e, stackTrace) {
        session.log('Error during JWT generation/signing for user $username', level: LogLevel.error, exception: e, stackTrace: stackTrace);
        return AuthResponse(success: false, message: 'Internal server error during login.');
      }

    } else {
      // Password does not match
      session.log('Login failed: Invalid password for user ($username)', level: LogLevel.warning);
      return AuthResponse(success: false, message: 'Invalid username or password.');
    }
  }

  // --- Sign Out ---
  // No server-side action is required for stateless JWTs.
  // The client is responsible for deleting the token upon logout.
  // You can keep this method empty or remove it if not needed for other logic.
  @override
  Future<void> signOut(Session session, {String? bearerToken}) async {
     session.log('SignOut endpoint called (JWT is stateless, no server action performed).', level: LogLevel.info);
     // If implementing a token blocklist, logic would go here.
     return Future.value(); // Indicate successful completion
  }


  // --- Endpoint to get current user's FULL profile info ---
  // Verifies JWT token passed as argument and returns combined profile.
  // TODO: Requires client to pass its JWT, prefixed with 'Bearer ', as the 'bearerToken' argument.
  // Make sure this matches the method name in the generated protocol if overriding
  Future<UserProfile?> getMyAkunInfo(Session session, {String? bearerToken}) async { // Changed return type
     int? currentUserId;
     String? currentUserRole; // Store role from JWT
     session.log('getMyAkunInfo endpoint called.', level: LogLevel.debug);

     // --- Verify JWT and Extract Claims ---
     if (bearerToken != null && bearerToken.startsWith('Bearer ')) {
        final token = bearerToken.substring(7);
        try {
           final String? secret = Serverpod.instance.getPassword(_jwtSecretKeyName);
           if (secret == null) throw Exception('JWT Secret Key not configured!');

           final jwt = JWT.verify(token, SecretKey(secret));
           currentUserId = jwt.payload['sub'] as int?;
           currentUserRole = jwt.payload['rol'] as String?; // Extract role
           session.log('[JWT] Verified successfully for userId: $currentUserId, role: $currentUserRole', level: LogLevel.info);

        } on JWTExpiredException { session.log('[JWT] Verification failed: Token expired.', level: LogLevel.info); return null; }
          on JWTException catch (ex) { session.log('[JWT] Verification failed: Invalid token. Reason: ${ex.message}', level: LogLevel.warning); return null; }
          catch (e, stackTrace){ session.log('[JWT] Unexpected error during verification.', level: LogLevel.error, exception: e, stackTrace: stackTrace); return null; }
     }

     if (currentUserId == null) {
        session.log('getMyAkunInfo: Not authenticated or user ID missing from token.', level: LogLevel.info);
        return null;
     }

     // --- Fetch Akun Record ---
     Akun? akun = await Akun.db.findById(session, currentUserId);
     if (akun == null) {
         session.log('getMyAkunInfo failed: Akun not found for user ID $currentUserId from JWT', level: LogLevel.warning);
         return null;
     }
     // Ensure JWT role matches DB role (optional security check)
     if (akun.role != currentUserRole) {
        session.log('getMyAkunInfo security warning: JWT role ($currentUserRole) does not match DB role (${akun.role}) for user ID $currentUserId.', level: LogLevel.warning);
        // Decide how to handle: trust DB, trust JWT, or deny access? For now, proceed but log.
     }

     // Create AkunInfo part
     final akunInfo = AkunInfo(
        id: akun.id!, relatedId: akun.relatedId, username: akun.username,
        email: akun.email, role: akun.role
     );

     // --- Fetch Role-Specific Profile ---
     Admin? adminProfile;
     // Member? memberProfile; // Uncomment if Member model exists
     // Sales? salesProfile; // Uncomment if Sales model exists

     if (akun.role.toLowerCase() == 'admin') {
         adminProfile = await Admin.db.findById(session, akun.relatedId);
         if (adminProfile == null) {
            session.log('getMyAkunInfo warning: Admin profile not found for relatedId ${akun.relatedId} of Akun ID ${akun.id}.', level: LogLevel.warning);
         }
     }
     // else if (akun.role.toLowerCase() == 'member' && akun.relatedId != null) {
     //     memberProfile = await Member.db.findById(session, akun.relatedId!);
     // }
     // else if (akun.role.toLowerCase() == 'sales' && akun.relatedId != null) {
     //     salesProfile = await Sales.db.findById(session, akun.relatedId!);
     // }

     // --- Construct and Return Full Profile ---
     return UserProfile(
        akunInfo: akunInfo,
        adminProfile: adminProfile,
        // memberProfile: memberProfile, // Uncomment if needed
        // salesProfile: salesProfile, // Uncomment if needed
     );
  }
}