// In my_project_server/lib/src/endpoints/akun_endpoint.dart

import 'package:serverpod/serverpod.dart';
import 'package:crypt/crypt.dart'; // Import the hashing library
import '../generated/protocol.dart';

class AkunEndpoint extends Endpoint {

  // --- CREATE ---
  // Adds a new Akun record. Hashes the password before saving.
  Future<Akun?> addAkun(Session session, Akun akun) async {
    // --- Security: Hash the password ---
    // Never store plain text passwords!
    if (akun.password.isNotEmpty) {
      // Using SHA-256 hashing from the 'crypt' package as an example.
      // BCrypt is generally preferred (available in packages like 'bcrypt').
      // Serverpod Auth module handles this securely.
      final hashedPassword = Crypt.sha256(akun.password).toString();
      akun.password = hashedPassword; // Replace plain password with hash
    } else {
      // Handle cases where password might be empty if allowed by your logic
       session.log('Attempted to add Akun with empty password for user ${akun.username}', level: LogLevel.warning);
       // Depending on requirements, you might return null or throw an exception
       // return null;
       // For now, we proceed but log it. Consider enforcing password policies.
    }

    try {
      await Akun.db.insertRow(session, akun);
      session.log('Akun added: ${akun.username}', level: LogLevel.info);
      // Return the inserted akun (which now includes the auto-generated ID)
      // Avoid returning the password hash if possible in real scenarios.
      return akun;
    } catch (e, stackTrace) {
       session.log('Failed to add Akun: ${akun.username}', exception: e, stackTrace: stackTrace, level: LogLevel.error);
       return null;
    }
  }

  // --- READ (Get All) ---
  // Retrieves all Akun records.
  // WARNING: This currently returns all fields, including the password hash.
  // In a real application, you should filter this or use a specific view-model
  // that excludes sensitive data.
  Future<List<Akun>> getAllAkun(Session session) async {
     session.log('Retrieving all Akun records', level: LogLevel.debug);
     // Consider adding filtering, sorting, and pagination parameters for large datasets.
     // Example: where, orderBy, limit, offset
     return await Akun.db.find(
        session,
        // Optional: Add ordering
        // orderBy: (t) => t.username,
     );
     // WARNING: Returning password hashes here is not ideal for security/privacy.
  }

  // --- READ (Get by ID) ---
  // Retrieves a single Akun by its ID.
  Future<Akun?> getAkunById(Session session, int id) async {
    session.log('Retrieving Akun by ID: $id', level: LogLevel.debug);
    var akun = await Akun.db.findById(session, id);
    // Again, consider if returning the password hash is appropriate.
    return akun;
  }

  // --- UPDATE ---
  // Updates an existing Akun record.
  // Hashes the password if it's being changed.
  Future<Akun?> updateAkun(Session session, Akun akun) async {
    // Ensure the Akun object has an ID
    if (akun.id == null) {
      session.log('Update failed: Akun ID is missing.', level: LogLevel.warning);
      return null; // Cannot update without an ID
    }

    try {
      // Fetch the existing record to compare password
      var existingAkun = await Akun.db.findById(session, akun.id!);
      if (existingAkun == null) {
         session.log('Update failed: Akun with ID ${akun.id} not found.', level: LogLevel.warning);
         return null;
      }

      // --- Security: Hash password ONLY if it has changed ---
      // Check if a new password was provided AND it's different from the stored hash
      // (Assuming akun.password contains a *new plain text password* if it's meant to be changed)
      if (akun.password.isNotEmpty && !Crypt(existingAkun.password).match(akun.password)) {
          // If the provided plain text password doesn't match the existing hash, hash the new one.
          final newHashedPassword = Crypt.sha256(akun.password).toString();
          akun.password = newHashedPassword; // Update the object with the new hash
          session.log('Updating password hash for Akun ID: ${akun.id}', level: LogLevel.info);
      } else {
          // If password in the input 'akun' is empty or matches the existing hash,
          // keep the existing hash.
          akun.password = existingAkun.password;
          session.log('Password not updated for Akun ID: ${akun.id}', level: LogLevel.debug);
      }

      // Perform the update
      // Note: Serverpod's default update replaces the entire row.
      // You might need more granular updates depending on your needs.
      await Akun.db.updateRow(session, akun);
      session.log('Akun updated: ID ${akun.id}', level: LogLevel.info);
      // Return the updated object (consider excluding password hash)
      return akun;

    } catch (e, stackTrace) {
        session.log('Failed to update Akun: ID ${akun.id}', exception: e, stackTrace: stackTrace, level: LogLevel.error);
        return null;
    }
  }

  // --- DELETE ---
  // Deletes an Akun record by its ID.
  Future<bool> deleteAkun(Session session, int id) async {
     try {
       var result = await Akun.db.deleteWhere(
         session,
         where: (t) => t.id.equals(id),
       );
       // deleteWhere returns the number of deleted rows.
       if (result.isNotEmpty && result.first == 1) { // Check if exactly one row was deleted
          session.log('Akun deleted: ID $id', level: LogLevel.info);
          return true;
       } else {
          session.log('Delete failed: Akun not found or multiple rows matched ID $id', level: LogLevel.warning);
          return false; // Akun not found or error
       }
     } catch (e, stackTrace) {
        session.log('Failed to delete Akun: ID $id', exception: e, stackTrace: stackTrace, level: LogLevel.error);
        return false;
     }
  }

  // Consider adding role-based access control here in the future.
  // For example, only 'admin' roles should be allowed to call deleteAkun.
  // @override
  // Future<void> handleStreamMessage(StreamingSession session, SerializableModel message) async {
  //   // Implement stream handling if needed
  // }
}