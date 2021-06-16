part of 'buildorders_bloc.dart';

abstract class BuildordersEvent extends Equatable {
  const BuildordersEvent();

  @override
  List<Object> get props => [];
}

class AllBuildordersRequested extends BuildordersEvent {}
