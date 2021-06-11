import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:colorbuilds/domain/data/models/SuccessResponse.dart';
import 'package:colorbuilds/infrastructure/exceptions/UnexpectedException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthInternalServerException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthRepositorySignupException.dart';
import 'package:colorbuilds/logic/auth/signup/bloc/signup_event.dart';
import 'package:colorbuilds/logic/form_submission_status.dart';

import '../../api_auth_repository.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final ApiAuthRepository authRepo;

  SignupBloc({required this.authRepo}) : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupSubmitted) {
      yield state.copyWith(
        email: event.email,
        username: event.username,
        password: event.password,
        formStatus: FormSubmitting(),
      );

      try {
        final SuccessResponse result = await authRepo.signup(
          email: state.email,
          username: state.username,
          password: state.password,
        );

        yield state.copyWith(formStatus: SubmissionSuccess(successResponse: result));
      } on ApiAuthInternalServerException catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e.e));
      } on ApiAuthRepositorySignupException catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e.e));
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(UnexpectedException(e)));
      }
    }
  }
}
