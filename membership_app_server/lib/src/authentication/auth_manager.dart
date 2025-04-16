import 'dart:math';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AuthManager {
  final Session session;

  AuthManager(this.session);

  Future<String?> signInUser(int userId, String role) async {
    // Generate random auth key
    final authKey = _generateAuthKey();
    
    // Simpan informasi user di cache
    await session.server.caches.local.put(
      'auth:$authKey',
      {'userId': userId, 'role': role} as SerializableModel,
      lifetime: const Duration(days: 30),
    );
    
    return authKey;
  }

  Future<Map<String, dynamic>?> verifyAuthKey(String authKey) async {
    return await session.server.caches.local.get('auth:$authKey');
  }

  String _generateAuthKey() {
    return 'auth_${DateTime.now().millisecondsSinceEpoch}_${_randomString(32)}';
  }

  String _randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }
}