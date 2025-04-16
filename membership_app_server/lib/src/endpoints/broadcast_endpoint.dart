// In my_project_server/lib/src/endpoints/broadcast_endpoint.dart

import 'package:serverpod/serverpod.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart'; // For JWT handling if needed in helper
import '../generated/protocol.dart'; // Should include Broadcast, Akun, etc.

class BroadcastEndpoint extends Endpoint {

  // --- Configuration & JWT Helper ---
  // Reuse the same secret key name as AuthEndpoint
  static const String _jwtSecretKeyName = 'jwtSecret';

  // Helper to verify JWT and return claims (same as used in other endpoints)
  // Ensure this helper exists and is accessible, or copy it here.
  // It should return Map<String, dynamic>? (payload) or null/throw on failure.
  Future<Map<String, dynamic>?> _verifyTokenAndGetClaims(Session session, String? bearerToken) async {
    if (bearerToken == null || !bearerToken.startsWith('Bearer ')) return null;
    final token = bearerToken.substring(7);
    final String? secret = Serverpod.instance.getPassword(_jwtSecretKeyName);
    if (secret == null) {
      session.log('FATAL: JWT Secret Key not configured!', level: LogLevel.error);
      return null; // Or throw
    }
    try {
        final jwt = JWT.verify(token, SecretKey(secret));
        return jwt.payload as Map<String, dynamic>;
    } on JWTException catch (ex) {
        session.log('[JWT] Verification failed in helper: ${ex.message}', level: LogLevel.warning);
        return null;
    }
  }

  // Permission Check Helper (Only Admins can manage broadcasts)
  Future<void> _checkAdminPermission(Session session, String? bearerToken) async {
    var claims = await _verifyTokenAndGetClaims(session, bearerToken);
    if (claims == null) throw Exception('Authentication Required.');

    int? userId = claims['sub'] as int?;
    String? role = claims['rol'] as String?; // Role from token

    if (userId == null || role == null) throw Exception('Invalid token payload.');
    if (role.toLowerCase() != 'admin') throw Exception('Access Denied: Admin role required.');
    // Optional: Check against DB if needed
  }
  // --- End Helpers ---


  // --- CREATE ---
  // Adds a new Broadcast message.
  Future<Broadcast?> addBroadcast(Session session, Broadcast broadcast, {String? bearerToken}) async {
    await _checkAdminPermission(session, bearerToken);
    // Set server-side timestamp for creation date
    broadcast.tanggalDibuat = DateTime.now().toUtc(); // Use UTC is good practice
    try {
      await Broadcast.db.insertRow(session, broadcast);
      var claims = await _verifyTokenAndGetClaims(session, bearerToken); // Get claims again for logging ID
      session.log('Broadcast added by user ${claims?['sub']}', level: LogLevel.info);
      return broadcast; // Return the created object with ID
    } catch (e, stackTrace) {
        session.log('Failed to add Broadcast', level: LogLevel.error, exception: e, stackTrace: stackTrace);
        return null; // Indicate failure
    }
  }

  // --- READ (Get All) ---
  // Retrieves all past Broadcast messages.
  Future<List<Broadcast>> getAllBroadcasts(Session session, {String? bearerToken}) async {
    await _checkAdminPermission(session, bearerToken);
    session.log('Retrieving all Broadcast records', level: LogLevel.debug);
    // Order by most recent first
    return await Broadcast.db.find(
        session,
        orderBy: (t) => t.tanggalDibuat,
        orderDescending: true
    );
  }

  // --- READ (Get by ID) ---
  // Retrieves a single Broadcast by its ID.
  Future<Broadcast?> getBroadcastById(Session session, int id, {String? bearerToken}) async {
    await _checkAdminPermission(session, bearerToken);
    session.log('Retrieving Broadcast by ID: $id', level: LogLevel.debug);
    return await Broadcast.db.findById(session, id);
  }

  // --- UPDATE ---
  // Updates an existing Broadcast message (e.g., fix typo, change target).
  Future<Broadcast?> updateBroadcast(Session session, Broadcast broadcast, {String? bearerToken}) async {
    await _checkAdminPermission(session, bearerToken);
    if (broadcast.id == null) {
        session.log('Update Broadcast failed: ID is missing.', level: LogLevel.warning);
        return null;
    }
    // Prevent changing the creation date on update
    var existing = await Broadcast.db.findById(session, broadcast.id!);
    if (existing == null) {
         session.log('Update Broadcast failed: Record not found for ID ${broadcast.id}.', level: LogLevel.warning);
         return null;
    }
    broadcast.tanggalDibuat = existing.tanggalDibuat; // Keep original creation date

    try {
        await Broadcast.db.updateRow(session, broadcast);
        session.log('Broadcast updated: ID ${broadcast.id}', level: LogLevel.info);
        return broadcast; // Return updated object
    } catch (e, stackTrace) {
        session.log('Failed to update Broadcast: ID ${broadcast.id}', level: LogLevel.error, exception: e, stackTrace: stackTrace);
        return null;
    }
  }

  // --- DELETE ---
  // Deletes a Broadcast message by its ID.
  Future<bool> deleteBroadcast(Session session, int id, {String? bearerToken}) async {
    // Only Admins can delete for now (could restrict to SuperAdmin if needed)
    await _checkAdminPermission(session, bearerToken);
    try {
        var result = await Broadcast.db.deleteWhere(
          session,
          where: (t) => t.id.equals(id),
        );
        // Check if any rows (expecting 1) were deleted
        if (result.isNotEmpty) {
            session.log('Broadcast deleted: ID $id', level: LogLevel.info);
            return true;
        } else {
            session.log('Delete Broadcast failed: Not found for ID $id', level: LogLevel.warning);
            return false;
        }
    } catch (e, stackTrace) {
        session.log('Failed to delete Broadcast: ID $id', level: LogLevel.error, exception: e, stackTrace: stackTrace);
        return false;
    }
  }
}