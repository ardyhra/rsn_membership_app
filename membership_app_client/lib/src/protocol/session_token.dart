/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class SessionToken implements _i1.SerializableModel {
  SessionToken._({
    this.id,
    required this.tokenHash,
    required this.userId,
    required this.createdAt,
    required this.expiresAt,
  });

  factory SessionToken({
    int? id,
    required String tokenHash,
    required int userId,
    required DateTime createdAt,
    required DateTime expiresAt,
  }) = _SessionTokenImpl;

  factory SessionToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return SessionToken(
      id: jsonSerialization['id'] as int?,
      tokenHash: jsonSerialization['tokenHash'] as String,
      userId: jsonSerialization['userId'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      expiresAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String tokenHash;

  int userId;

  DateTime createdAt;

  DateTime expiresAt;

  /// Returns a shallow copy of this [SessionToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SessionToken copyWith({
    int? id,
    String? tokenHash,
    int? userId,
    DateTime? createdAt,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tokenHash': tokenHash,
      'userId': userId,
      'createdAt': createdAt.toJson(),
      'expiresAt': expiresAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SessionTokenImpl extends SessionToken {
  _SessionTokenImpl({
    int? id,
    required String tokenHash,
    required int userId,
    required DateTime createdAt,
    required DateTime expiresAt,
  }) : super._(
          id: id,
          tokenHash: tokenHash,
          userId: userId,
          createdAt: createdAt,
          expiresAt: expiresAt,
        );

  /// Returns a shallow copy of this [SessionToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SessionToken copyWith({
    Object? id = _Undefined,
    String? tokenHash,
    int? userId,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) {
    return SessionToken(
      id: id is int? ? id : this.id,
      tokenHash: tokenHash ?? this.tokenHash,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}
