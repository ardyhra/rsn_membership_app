import 'package:serverpod/serverpod.dart';
import '../generated/akun.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AkunEndpoint extends Endpoint {
  @override
  bool get requireLogin => true; // 🔐 Wajib login untuk operasi CRUD

  // 🔹 Ambil semua akun (khusus Admin)
  Future<List<Akun>> getAllAkun(Session session) async {
    if (!_isAdmin(session)) {
      throw Exception('Akses ditolak! Hanya admin yang dapat melihat semua akun.');
    }
    return await Akun.db.find(session);
  }

  // 🔹 Ambil satu akun berdasarkan ID
  Future<Akun?> getAkunById(Session session, int id) async {
    if (!_isAdmin(session)) {
      throw Exception('Akses ditolak! Hanya admin yang dapat melihat detail akun.');
    }
    return await Akun.db.findById(session, id);
  }

  // 🔹 Tambah akun baru (Hanya Admin)
  Future<bool> addAkun(Session session, Akun akun) async {
    if (!_isAdmin(session)) {
      throw Exception('Akses ditolak! Hanya admin yang dapat menambah akun.');
    }

    // Hash password sebelum disimpan
    akun.password = _hashPassword(akun.password);

    final result = await Akun.db.insertRow(session, akun);
    return result.id != null;
  }

  // 🔹 Update akun
  Future<bool> updateAkun(Session session, Akun akun) async {
    if (!_isAdmin(session) && session.userObject?.id != akun.id) {
      throw Exception('Akses ditolak! Hanya admin atau pemilik akun yang dapat mengedit.');
    }

    if (akun.password.isNotEmpty) {
      akun.password = _hashPassword(akun.password);
    }

    final result = await Akun.db.updateRow(session, akun);
    return result.id != null;
  }

  // 🔹 Hapus akun (Hanya Admin)
  Future<bool> deleteAkun(Session session, int id) async {
    if (!_isAdmin(session)) {
      throw Exception('Akses ditolak! Hanya admin yang dapat menghapus akun.');
    }

    final deletedRows = await Akun.db.deleteWhere(session, where: (t) => t.id.equals(id));
    return deletedRows.isNotEmpty;
  }

  // 🔹 Fungsi Cek Admin
  bool _isAdmin(Session session) {
    return session.userObject?.scopeNames.contains('admin') ?? false;
  }

  // 🔹 Fungsi Hash Password
  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }
}
