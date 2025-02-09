// import 'package:serverpod/serverpod.dart';
// import 'package:crypto/crypto.dart';
// import 'package:serverpod_auth_server/module.dart';
// import 'dart:convert';
// import '../generated/akun.dart';

// /// Model untuk mengenkapsulasi informasi user yang terautentikasi.
// class AkunUser implements UserInfo {
//   @override
//   final int id;
//   @override
//   final String email;
//   @override
//   final String fullName;
//   final String role;

//   AkunUser({
//     required this.id,
//     required this.email,
//     required this.fullName,
//     required this.role,
//   });
// }

// class AuthEndpoint extends Endpoint {
//   // Endpoint login tidak memerlukan autentikasi (agar user bisa login)
//   @override
//   bool get requireLogin => false;

//   /// Fungsi login menerima username dan password.
//   /// Jika valid, akan membuat session dan mengembalikan token.
//   Future<String?> login(Session session, String username, String password) async {
//     // Hash password (misalnya menggunakan SHA256)
//     final hashedPassword = sha256.convert(utf8.encode(password)).toString();

//     // Cari akun berdasarkan username dan password yang telah di-hash.
//     final akun = await Akun.db.findFirstRow(
//       session,
//       where: (t) => t.username.equals(username) & t.password.equals(hashedPassword),
//     );

//     if (akun == null) {
//       // Jika tidak ditemukan, lempar exception atau kembalikan null
//       throw Exception('Login gagal: username atau password salah');
//     }

//     // Buat token dari session
//     final token = sessionManager.createSessionToken(session);

//     // Tandai sesi dengan user yang terautentikasi.
//     // Anda dapat menyimpan objek AkunUser agar role dan data lainnya tersedia.
//     session.authenticatedUser = AkunUser(
//       id: akun.id!,
//       email: akun.email,
//       fullName: akun.username,
//       role: akun.role,
//     );

//     // Kembalikan token ke client
//     return token;
//   }

//   Future<void> logout(Session session) async {
//     await session.auth.signOut();
//   }
// }
