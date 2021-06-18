part of 'buildorders_bloc.dart';

class BuildordersState extends Equatable {
  final List<Buildorder> filtered;
  final List<Buildorder> buildorders;
  final ApiResponseStatus apiResponseStatus;

  const BuildordersState({required this.filtered, required this.buildorders, required this.apiResponseStatus});

  BuildordersState copyWith({
    List<Buildorder>? filtered,
    List<Buildorder>? buildorders,
    ApiResponseStatus? apiResponseStatus,
  }) {
    return BuildordersState(
      filtered: filtered ?? this.filtered,
      buildorders: buildorders ?? this.buildorders,
      apiResponseStatus: apiResponseStatus ?? this.apiResponseStatus,
    );
  }

  @override
  List<Object> get props => [filtered, buildorders, apiResponseStatus];
}

class BuildordersInitial extends BuildordersState {
  BuildordersInitial()
      : super(
          filtered: [],
          buildorders: [],
          apiResponseStatus: ApiResponseStatusInitial(),
        );
}
