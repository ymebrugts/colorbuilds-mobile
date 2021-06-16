part of 'buildorders_bloc.dart';

class BuildordersState extends Equatable {
  final List<Buildorder> buildorders;
  final ApiResponseStatus apiResponseStatus;

  const BuildordersState({required this.buildorders, required this.apiResponseStatus});

  BuildordersState copyWith({
    List<Buildorder>? buildorders,
    ApiResponseStatus? apiResponseStatus,
  }) {
    return BuildordersState(
      buildorders: buildorders ?? this.buildorders,
      apiResponseStatus: apiResponseStatus ?? this.apiResponseStatus,
    );
  }

  @override
  List<Object> get props => [buildorders, apiResponseStatus];
}

class BuildordersInitial extends BuildordersState {
  BuildordersInitial()
      : super(
          buildorders: [],
          apiResponseStatus: ApiResponseStatusInitial(),
        );
}
