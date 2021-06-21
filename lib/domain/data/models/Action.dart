import 'dart:convert';

import 'package:colorbuilds/infrastructure/exceptions/data/ActionModelDataException.dart';
import 'package:equatable/equatable.dart';

class Action extends Equatable {
  final int id;
  final int order;
  final String action;
  final double amount;
  final double amountChrono;
  final bool chrono;
  final bool onlyChrono;
  final bool tillFinished;
  final String type;
  final double version;

  const Action({
    required this.id,
    required this.order,
    required this.action,
    required this.amount,
    required this.amountChrono,
    required this.chrono,
    required this.onlyChrono,
    required this.tillFinished,
    required this.type,
    required this.version,
  });

  Action copyWith({
    int? id,
    int? order,
    String? action,
    double? amount,
    double? amountChrono,
    bool? chrono,
    bool? onlyChrono,
    bool? tillFinished,
    String? type,
    double? version,
  }) {
    return Action(
      id: id ?? this.id,
      order: order ?? this.order,
      action: action ?? this.action,
      amount: amount ?? this.amount,
      amountChrono: amountChrono ?? this.amountChrono,
      chrono: chrono ?? this.chrono,
      onlyChrono: onlyChrono ?? this.onlyChrono,
      tillFinished: tillFinished ?? this.tillFinished,
      type: type ?? this.type,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'action': action,
      'amount': amount,
      'amountChrono': amountChrono,
      'chrono': chrono,
      'onlyChrono': onlyChrono,
      'tillFinished': tillFinished,
      'type': type,
      'version': version,
    };
  }

  factory Action.fromMap(Map<String, dynamic> map) {
    try {
      return Action(
        id: int.parse(map['id'].toString()),
        order: int.parse(map['order'].toString()),
        action: map['action'].toString(),
        amount: double.parse(map['amount'].toString()),
        amountChrono: double.parse(map['amountChrono'].toString()),
        chrono: map['chrono'] as bool,
        onlyChrono: map['onlyChrono'] as bool,
        tillFinished: map['tillFinished'] as bool,
        type: map['type'].toString(),
        version: double.parse(map['version'].toString()),
      );
    } catch (e) {
      throw ActionModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Action.fromJson(String source) => Action.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [id, order, action, amount, amountChrono, chrono, onlyChrono, tillFinished, type, version];
  }
}
