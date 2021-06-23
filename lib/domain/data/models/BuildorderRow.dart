import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:colorbuilds/infrastructure/exceptions/data/BuildorderRowModelDataException.dart';

import 'Action.dart';

class BuildorderRow extends Equatable {
  final int id;
  final int? orderRow;
  final int? supply;
  final int? minutes;
  final int? seconds;
  final int? resources;
  final bool mineralsSelected;
  final bool gasSelected;
  final String? notes;
  final List<Action> actions;

  const BuildorderRow({
    required this.id,
    this.orderRow,
    this.supply,
    this.minutes,
    this.seconds,
    this.resources,
    required this.mineralsSelected,
    required this.gasSelected,
    this.notes,
    required this.actions,
  });

  BuildorderRow copyWith({
    int? id,
    int? orderRow,
    int? supply,
    int? minutes,
    int? seconds,
    int? resources,
    bool? mineralsSelected,
    bool? gasSelected,
    String? notes,
    List<Action>? actions,
  }) {
    return BuildorderRow(
      id: id ?? this.id,
      orderRow: orderRow ?? this.orderRow,
      supply: supply ?? this.supply,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
      resources: resources ?? this.resources,
      mineralsSelected: mineralsSelected ?? this.mineralsSelected,
      gasSelected: gasSelected ?? this.gasSelected,
      notes: notes ?? this.notes,
      actions: actions ?? this.actions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'orderRow': orderRow,
      'supply': supply,
      'minutes': minutes,
      'seconds': seconds,
      'resources': resources,
      'mineralsSelected': mineralsSelected,
      'gasSelected': gasSelected,
      'notes': notes,
      'actions': actions.map((x) => x.toMap()).toList(),
    };
  }

  factory BuildorderRow.fromMap(Map<String, dynamic> map) {
    try {
      return BuildorderRow(
        id: int.parse(map['id'].toString()),
        orderRow: int.tryParse(map['orderRow'].toString()),
        supply: int.tryParse(map['supply'].toString()),
        minutes: int.tryParse(map['minutes'].toString()),
        seconds: int.tryParse(map['seconds'].toString()),
        resources: int.tryParse(map['resources'].toString()),
        mineralsSelected: map['mineralsSelected'] as bool,
        gasSelected: map['gasSelected'] as bool,
        notes: map['notes'].toString(),
        actions: map['actions'] != null
            ? List<Action>.from(map['actions']?.map(
                (dynamic x) => Action.fromMap(x as Map<String, dynamic>),
              ) as Iterable)
            : [],
      );
    } catch (e) {
      throw BuildorderRowModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory BuildorderRow.fromJson(String source) => BuildorderRow.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [id, mineralsSelected, gasSelected, actions];
  }

  String get getResourcesString {
    if (gasSelected && mineralsSelected) {
      return ' @$resources Gas - @$resources Minerals';
    } else if (gasSelected && resources! > 0) {
      return ' @$resources Gas';
    } else if (mineralsSelected && resources! > 0) {
      return ' @$resources Minerals';
    }
    return '';
  }
}
