import 'dart:convert';

import 'package:equatable/equatable.dart';

class SuccessResponse extends Equatable {
  final String message;

  const SuccessResponse({required this.message});

  SuccessResponse copyWith({String? message}) => SuccessResponse(message: message ?? this.message);

  Map<String, dynamic> toMap() => <String, dynamic>{'message': message};

  factory SuccessResponse.fromMap(Map<String, dynamic> map) => SuccessResponse(message: map['message'].toString());

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [message];
}
