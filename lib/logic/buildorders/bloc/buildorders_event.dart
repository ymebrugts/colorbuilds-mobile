part of 'buildorders_bloc.dart';

abstract class BuildordersEvent extends Equatable {
  const BuildordersEvent();

  @override
  List<Object> get props => [];
}

class AllBuildordersRequested extends BuildordersEvent {}

class FilteredByRace extends BuildordersEvent {
  final String? yourRace;
  final String? opponentRace;

  const FilteredByRace({this.yourRace, this.opponentRace});
}

class FilteredByName extends BuildordersEvent {
  final String? name;

  const FilteredByName({this.name});
}
