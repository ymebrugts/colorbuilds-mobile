import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';

class BuildordersActions {
  ///
  void index({required BuildordersBloc bloc}) {
    bloc.add(AllBuildordersRequested());
  }
}
