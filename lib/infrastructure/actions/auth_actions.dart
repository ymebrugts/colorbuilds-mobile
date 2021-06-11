import 'package:colorbuilds/logic/auth/login/bloc/login_bloc.dart';
import 'package:colorbuilds/logic/auth/login/bloc/login_event.dart';
import 'package:colorbuilds/logic/auth/signup/bloc/signup_bloc.dart';
import 'package:colorbuilds/logic/auth/signup/bloc/signup_event.dart';

class AuthActions {
  ///
  void login({
    required LoginBloc bloc,
    required String email,
    required String password,
  }) {
    bloc.add(LoginSubmitted(email: email, password: password));
  }

  ///
  void signup({
    required SignupBloc bloc,
    required String email,
    required String username,
    required String password,
  }) {
    bloc.add(SignupSubmitted(email: email, username: username, password: password));
  }

  ///
  void checkEmail({required SignupBloc bloc, required String email}) {
    bloc.add(SignupEmailSubmitted(email));
  }

  ///
  void checkUsername({required SignupBloc bloc, required String username}) {
    bloc.add(SignupUsernameSubmitted(username));
  }
}
