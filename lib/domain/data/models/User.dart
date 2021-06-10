import 'dart:convert';

import 'package:colorbuilds/infrastructure/exceptions/data/UserModelDataException.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String? email;
  final String? username;
  final int? issuedAt;
  final int? expiry;

  const User({required this.id, this.email, this.username, this.issuedAt, this.expiry});

  User copyWith({int? id, String? email, String? username, int? issuedAt, int? expiry}) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      issuedAt: issuedAt ?? this.issuedAt,
      expiry: expiry ?? this.expiry,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'username': username,
      'issuedAt': issuedAt,
      'expiry': expiry,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    try {
      return User(
        id: int.parse(map['userId'].toString()),
        email: map['email'].toString(),
        username: map['username'].toString(),
        issuedAt: int.tryParse(map['iat'].toString()),
        expiry: int.tryParse(map['exp'].toString()),
      );
    } catch (e) {
      throw UserModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        email ?? 'NO EMAIL',
        username ?? 'NO USERNAME',
        expiry ?? 'NO EXPIRY',
        issuedAt ?? 'NO ISSUED AT',
      ];
}
