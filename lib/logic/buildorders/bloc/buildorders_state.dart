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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'filtered': filtered.map((x) => x.toMap()).toList(),
      'buildorders': buildorders.map((x) => x.toMap()).toList(),
      'apiResponseStatus': apiResponseStatus.toString(),
    };
  }

  factory BuildordersState.fromMap(Map<String, dynamic> map) {
    return BuildordersState(
      filtered: List<Buildorder>.from(
          map['filtered']?.map((dynamic x) => Buildorder.fromMap(x as Map<String, dynamic>)) as Iterable),
      buildorders: List<Buildorder>.from(
          map['buildorders']?.map((dynamic x) => Buildorder.fromMap(x as Map<String, dynamic>)) as Iterable),
      apiResponseStatus: ApiResponseStatusSuccess(),
    );
  }

  String toJson() => json.encode(toMap());

  factory BuildordersState.fromJson(String source) =>
      BuildordersState.fromMap(json.decode(source) as Map<String, dynamic>);
}

class BuildordersInitial extends BuildordersState {
  BuildordersInitial()
      : super(
          filtered: [],
          buildorders: [],
          apiResponseStatus: ApiResponseStatusInitial(),
        );
}
