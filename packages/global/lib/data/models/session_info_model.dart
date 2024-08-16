// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SessionInfo extends Equatable {
  final String? access;
  final String? refresh;
  final String? user;
  final String? role;
  final bool? phone_verified;
  final String? phone;
  const SessionInfo(
      {this.access,
      this.refresh,
      this.user,
      this.role,
      this.phone_verified = false,
      this.phone});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [access, refresh, user, role, phone_verified, phone];

  SessionInfo copyWith({
    String? access,
    String? refresh,
    String? user,
    String? role,
    bool? phone_verified,
    String? phone,
  }) {
    return SessionInfo(
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
      user: user ?? this.user,
      role: role ?? this.role,
      phone_verified: phone_verified ?? this.phone_verified,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access': access,
      'refresh': refresh,
      'user': user,
      'role': role,
      'phone_verified': phone_verified,
      'phone': phone,
    };
  }

  factory SessionInfo.fromMap(Map<dynamic, dynamic>? map) {
    return SessionInfo(
      access: map?['access'] ?? null,
      refresh: map?['refresh'] ?? null,
      user: map?['user'] ?? null,
      role: map?['role'] ?? null,
      phone_verified: map?['phone_verified'] ?? null,
      phone: map?['phone'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionInfo.fromJson(String source) =>
      SessionInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
