import 'package:colorbuilds/logic/auth/login/bloc/login_bloc.dart';
import 'package:colorbuilds/logic/auth/login/bloc/login_event.dart';

class AuthActions {
  ///
  void login({required LoginBloc bloc, required String email, required String password}) {
    bloc.add(LoginSubmitted(email: email, password: password));
  }
}
