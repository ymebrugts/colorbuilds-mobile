import 'dart:convert';

import 'package:colorbuilds/infrastructure/exceptions/data/BuildorderModelDataException.dart';
import 'package:equatable/equatable.dart';

import 'package:colorbuilds/domain/data/models/BuildorderRow.dart';

class Buildorder extends Equatable {
  final int id;
  final int? order;
  final String name;
  final String? yourRace;
  final String? endOfBoNotes;
  final String? opponentRace;
  final bool privateBuildorder;
  final List<BuildorderRow>? rows;

  const Buildorder({
    required this.id,
    required this.order,
    required this.name,
    this.yourRace,
    this.endOfBoNotes,
    this.opponentRace,
    required this.privateBuildorder,
    this.rows,
  });

  Buildorder copyWith({
    int? id,
    int? order,
    String? name,
    String? yourRace,
    String? endOfBoNotes,
    String? opponentRace,
    bool? privateBuildorder,
    List<BuildorderRow>? rows,
  }) {
    return Buildorder(
      id: id ?? this.id,
      order: order ?? this.order,
      name: name ?? this.name,
      yourRace: yourRace ?? this.yourRace,
      endOfBoNotes: endOfBoNotes ?? this.endOfBoNotes,
      opponentRace: opponentRace ?? this.opponentRace,
      privateBuildorder: privateBuildorder ?? this.privateBuildorder,
      rows: rows ?? this.rows,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'name': name,
      'yourRace': yourRace,
      'endOfBoNotes': endOfBoNotes,
      'opponentRace': opponentRace,
      'privateBuildorder': privateBuildorder,
      'rows': rows?.map((x) => x.toMap()).toList(),
    };
  }

  factory Buildorder.fromMap(Map<String, dynamic> map) {
    try {
      return Buildorder(
        id: int.parse(map['id'].toString()),
        order: int.tryParse(map['order'].toString()),
        name: map['name'].toString(),
        yourRace: map['yourRace'].toString(),
        endOfBoNotes: map['endOfBoNotes'].toString(),
        opponentRace: map['opponentRace'].toString(),
        privateBuildorder: map['privateBuildorder'] as bool,
        rows: map['rows'] != null
            ? List<BuildorderRow>.from(
                map['rows']?.map((dynamic x) => BuildorderRow.fromMap(x as Map<String, dynamic>)) as Iterable)
            : null,
      );
    } catch (e) {
      throw BuildorderModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Buildorder.fromJson(String source) => Buildorder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [id, name, privateBuildorder];
  }
}
