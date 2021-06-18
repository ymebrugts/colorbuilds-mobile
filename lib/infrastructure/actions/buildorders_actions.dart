import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';

class BuildordersActions {
  ///
  void index({required BuildordersBloc bloc}) {
    bloc.add(AllBuildordersRequested());
  }

  void filterByRace({
    String? yourRace,
    String? opponentRace,
    required BuildordersBloc bloc,
  }) {
    bloc.add(FilterByRace(yourRace: yourRace, opponentRace: opponentRace));
  }
}
