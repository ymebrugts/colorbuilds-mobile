import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:colorbuilds/domain/data/models/SuccessResponse.dart';
import 'package:colorbuilds/infrastructure/exceptions/UnexpectedException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthInternalServerException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthRepositoryCheckEmailExistenceException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthRepositoryCheckUsernameExistenceException.dart';
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
    /// Signup Submission
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
        yield state.copyWith(formStatus: SubmissionFailure(e.e));
      } on ApiAuthRepositorySignupException catch (e) {
        yield state.copyWith(formStatus: SubmissionFailure(e.e));
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailure(UnexpectedException(e)));
      }
    }

    /// Email Submission
    else if (event is SignupEmailSubmitted) {
      yield state.copyWith(
        email: event.email,
        formStatus: FormValidating(),
      );

      try {
        final bool? result = await authRepo.checkEmailExistence(email: state.email);

        if (result == false) {
          yield state.copyWith(emailExists: false, formStatus: FormValidationSuccess());
        } else if (result == true) {
          yield state.copyWith(emailExists: true, formStatus: FormValidationFailure());
        }
      } on ApiAuthInternalServerException catch (e) {
        yield state.copyWith(formStatus: SubmissionFailure(e.e));
      } on ApiAuthRepositoryCheckEmailExistenceException catch (e) {
        yield state.copyWith(formStatus: SubmissionFailure(e.e));
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailure(UnexpectedException(e)));
      }
    }

    /// Username Submission
    else if (event is SignupUsernameSubmitted) {
      yield state.copyWith(
        username: event.username,
        formStatus: FormValidating(),
      );

      try {
        final bool? result = await authRepo.checkUsernameExistence(username: state.username);

        if (result == false) {
          yield state.copyWith(usernameExists: false, formStatus: FormValidationSuccess());
        } else if (result == true) {
          yield state.copyWith(usernameExists: true, formStatus: FormValidationFailure());
        }
      } on ApiAuthInternalServerException catch (e) {
        yield state.copyWith(formStatus: SubmissionFailure(e.e));
      } on ApiAuthRepositoryCheckUsernameExistenceException catch (e) {
        yield state.copyWith(formStatus: SubmissionFailure(e.e));
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailure(UnexpectedException(e)));
      }
    }
  }
}
