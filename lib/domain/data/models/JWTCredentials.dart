import 'dart:convert';

import 'package:equatable/equatable.dart';

class JWTCredentials extends Equatable {
  final String token;
  const JWTCredentials({required this.token});

  JWTCredentials copyWith({String? token}) => JWTCredentials(token: token ?? this.token);

  Map<String, dynamic> toMap() => <String, dynamic>{'token': token};

  factory JWTCredentials.fromMap(Map<String, dynamic> map) => JWTCredentials(token: map['token'].toString());

  String toJson() => json.encode(toMap());

  factory JWTCredentials.fromJson(String source) => JWTCredentials.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [token];
}
