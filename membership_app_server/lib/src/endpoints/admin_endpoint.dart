// In my_project_server/lib/src/endpoints/admin_endpoint.dart

import 'package:serverpod/serverpod.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import '../generated/protocol.dart'; // Includes Admin, Akun, AkunInfo etc.

class AdminEndpoint extends Endpoint {

  // --- Configuration ---
  // Name of the key in generator.yaml/config/*.yaml under 'passwords:' section
  // MUST MATCH the one used in AuthEndpoint
  static const String _jwtSecretKeyName = 'jwtSecret';

  // --- Helper: Verify JWT and Get Claims ---
  // Returns JWT payload if valid, otherwise null or throws exception
  Future<Map<String, dynamic>?> _verifyTokenAndGetClaims(Session session, String? bearerToken) async {
    if (bearerToken == null || !bearerToken.startsWith('Bearer ')) {
      session.log('JWT verification failed: No Bearer token provided.', level: LogLevel.info);
      return null;
    }
    final token = bearerToken.substring(7);
    final String? secret = Serverpod.instance.getPassword(_jwtSecretKeyName);
    if (secret == null) {
      session.log('FATAL: JWT Secret Key "$_jwtSecretKeyName" is not configured!', level: LogLevel.error);
      throw Exception('Server configuration error.'); // Or return null if preferred
    }

    try {
      final jwt = JWT.verify(token, SecretKey(secret));
      return jwt.payload as Map<String, dynamic>;
    } on JWTExpiredException {
      session.log('[JWT] Verification failed: Token expired.', level: LogLevel.info);
      return null;
    } on JWTException catch (ex) {
      session.log('[JWT] Verification failed: Invalid token. Reason: ${ex.message}', level: LogLevel.warning);
      return null;
    } catch (e, stackTrace){
      session.log('[JWT] Unexpected error during verification.', level: LogLevel.error, exception: e, stackTrace: stackTrace);
      return null;
    }
  }

  // --- Helper: Check Admin Permission ---
  // Verifies JWT and checks if the user is an admin or superadmin
  Future<Akun?> _verifyAdminPermission(Session session, String? bearerToken, {bool requireSuperAdmin = false}) async {
     var payload = await _verifyTokenAndGetClaims(session, bearerToken);
     if (payload == null) {
        throw Exception('Authentication Required.');
     }
     int? userId = payload['sub'] as int?;
     String? role = payload['rol'] as String?;

     if (userId == null || role == null) {
         throw Exception('Invalid token payload.');
     }

     // Fetch the requesting user's Akun details to double-check role from DB
     var requestingUser = await Akun.db.findById(session, userId);
     if (requestingUser == null || requestingUser.role.toLowerCase() != 'admin') {
         throw Exception('Access Denied: Admin role required.');
     }

     // If superAdmin is required, check the related Admin record's flag
     if (requireSuperAdmin) {
         if (requestingUser.relatedId == null) {
             throw Exception('Access Denied: SuperAdmin role required (user has no related Admin ID).');
         }
         var requestingAdminProfile = await Admin.db.findById(session, requestingUser.relatedId!);
         if (requestingAdminProfile == null || !requestingAdminProfile.superAdmin) {
             throw Exception('Access Denied: SuperAdmin role required.');
         }
     }
     // Return the requesting user's Akun if needed, or just null if only permission check matters
     return requestingUser;
  }


  // --- CREATE ---
  // Adds a new Admin record. Requires Admin permission.
  Future<Admin?> addAdmin(Session session, Admin admin, {String? bearerToken}) async {
    await _verifyAdminPermission(session, bearerToken); // Check if caller is admin
    try {
       await Admin.db.insertRow(session, admin);
       session.log('Admin added: NIP ${admin.nip}', level: LogLevel.info);
       return admin; // Return created admin with ID
    } catch (e, stackTrace) {
        session.log('Failed to add Admin: NIP ${admin.nip}', level: LogLevel.error, exception: e, stackTrace: stackTrace);
        return null; // Or rethrow specific exceptions
    }
  }

  // --- READ (Get All) ---
  // Retrieves all Admin records. Requires Admin permission.
  Future<List<Admin>> getAllAdmins(Session session, {String? bearerToken}) async {
    await _verifyAdminPermission(session, bearerToken);
    session.log('Retrieving all Admin records', level: LogLevel.debug);
    return await Admin.db.find(session, orderBy: (t) => t.namaAdmin);
  }

  // --- READ (Get by ID) ---
  // Retrieves a single Admin by its ID. Requires Admin permission.
  Future<Admin?> getAdminById(Session session, int adminId, {String? bearerToken}) async {
    await _verifyAdminPermission(session, bearerToken);
    session.log('Retrieving Admin by ID: $adminId', level: LogLevel.debug);
    return await Admin.db.findById(session, adminId);
  }

  // --- UPDATE ---
  // Updates an existing Admin record. Requires Admin permission.
  Future<Admin?> updateAdmin(Session session, Admin admin, {String? bearerToken}) async {
    await _verifyAdminPermission(session, bearerToken);
    if (admin.id == null) {
        session.log('Update Admin failed: ID is missing.', level: LogLevel.warning);
        return null;
    }
    try {
        await Admin.db.updateRow(session, admin);
        session.log('Admin updated: ID ${admin.id}', level: LogLevel.info);
        return admin; // Return updated admin
    } catch (e, stackTrace) {
        session.log('Failed to update Admin: ID ${admin.id}', level: LogLevel.error, exception: e, stackTrace: stackTrace);
        return null;
    }
  }

  // --- DELETE ---
  // Deletes an Admin record by its ID. Requires SuperAdmin permission.
  Future<bool> deleteAdmin(Session session, int adminId, {String? bearerToken}) async {
     // Use helper to verify SuperAdmin role
     await _verifyAdminPermission(session, bearerToken, requireSuperAdmin: true);
     try {
        var result = await Admin.db.deleteWhere(
           session,
           where: (t) => t.id.equals(adminId),
        );
        if (result.isNotEmpty) {
            session.log('Admin deleted: ID $adminId', level: LogLevel.info);
            return true;
        } else {
             session.log('Delete Admin failed: Admin not found for ID $adminId', level: LogLevel.warning);
            return false;
        }
     } catch (e, stackTrace) {
        session.log('Failed to delete Admin: ID $adminId', level: LogLevel.error, exception: e, stackTrace: stackTrace);
        return false;
     }
  }
}