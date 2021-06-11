import 'package:colorbuilds/infrastructure/actions/auth_actions.dart';
import 'package:colorbuilds/logic/auth/api_auth_repository.dart';
import 'package:colorbuilds/logic/auth/login/bloc/login_bloc.dart';
import 'package:colorbuilds/logic/auth/login/bloc/login_state.dart';
import 'package:colorbuilds/logic/form_submission_status.dart';
import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:colorbuilds/presentation/screens/auth/login/components/login_card_body.dart';
import 'package:colorbuilds/presentation/screens/auth/scaffold/auth_scaffold.dart';
import 'package:colorbuilds/presentation/utils/custom_snackbars.dart';
import 'package:colorbuilds/presentation/widgets/card/custom_card_with_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final AuthActions _authActions = AuthActions();

  void _resolveSubmissionMessage(BuildContext context, LoginState state) {
    final CustomSnackbars customSnackbars = CustomSnackbars(context);
    if (state.formStatus is SubmissionFailure) {
      final formStatus = state.formStatus as SubmissionFailure;
      customSnackbars.showErrorMessageSnackbar(formStatus.e.toString());
    } else if (state.formStatus is SubmissionSuccess) {
      customSnackbars.showSuccessMessageSnackbar('Logged in successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepo: context.read<ApiAuthRepository>(),
        sessionCubit: context.read<SessionCubit>(),
        storage: FlutterSecureStorage(),
      ),
      child: BlocListener<LoginBloc, LoginState>(
        listener: _resolveSubmissionMessage,
        child: AuthScaffold(
          child: Center(
            child: CustomCardWithHeader(
              title: 'Login',
              body: LoginCardBody(authActions: _authActions),
            ),
          ),
        ),
      ),
    );
  }
}
