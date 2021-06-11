import 'package:colorbuilds/infrastructure/actions/auth_actions.dart';
import 'package:colorbuilds/logic/auth/api_auth_repository.dart';
import 'package:colorbuilds/logic/auth/signup/bloc/signup_bloc.dart';
import 'package:colorbuilds/logic/auth/signup/bloc/signup_state.dart';
import 'package:colorbuilds/logic/form_submission_status.dart';
import 'package:colorbuilds/presentation/screens/auth/scaffold/auth_scaffold.dart';
import 'package:colorbuilds/presentation/screens/auth/signup/components/signup_card_body.dart';
import 'package:colorbuilds/presentation/utils/custom_snackbars.dart';
import 'package:colorbuilds/presentation/widgets/card/custom_card_with_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final AuthActions _authActions = AuthActions();

  void _resolveSubmissionMessage(BuildContext context, SignupState state) {
    final CustomSnackbars customSnackbars = CustomSnackbars(context);
    if (state.formStatus is SubmissionFailure) {
      final formStatus = state.formStatus as SubmissionFailure;
      customSnackbars.showErrorMessageSnackbar(formStatus.e.toString());
    } else if (state.formStatus is SubmissionSuccess) {
      final formStatus = state.formStatus as SubmissionSuccess;
      customSnackbars.showSuccessMessageSnackbar(formStatus.successResponse!.message);
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(authRepo: context.read<ApiAuthRepository>()),
      child: BlocListener<SignupBloc, SignupState>(
        listener: _resolveSubmissionMessage,
        child: AuthScaffold(
          child: Center(
            child: CustomCardWithHeader(
              title: 'Create ColorBuilds account',
              body: SignupCardBody(authActions: _authActions),
            ),
          ),
        ),
      ),
    );
  }
}
