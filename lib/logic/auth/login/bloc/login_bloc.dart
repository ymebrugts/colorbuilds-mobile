import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:colorbuilds/domain/data/models/JWTCredentials.dart';
import 'package:colorbuilds/domain/data/models/User.dart';
import 'package:colorbuilds/infrastructure/exceptions/UnexpectedException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthRepositoryLoginException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiInternalServerException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiUnauthenticatedException.dart';
import 'package:colorbuilds/infrastructure/utils/jwt_utils.dart';
import 'package:colorbuilds/logic/form_submission_status.dart';
import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../api_auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SessionCubit sessionCubit;
  final ApiAuthRepository authRepo;
  final FlutterSecureStorage storage;

  LoginBloc({
    required this.authRepo,
    required this.sessionCubit,
    required this.storage,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitted) {
      yield state.copyWith(
        email: event.email,
        password: event.password,
        formStatus: FormSubmitting(),
      );

      try {
        final JWTCredentials creds = await authRepo.login(email: state.email, password: state.password);
        final JWTUtils jwtUtils = JWTUtils(token: creds.token);

        final User user = User.fromMap(jwtUtils.parseJwt());

        yield state.copyWith(formStatus: SubmissionSuccess());
        sessionCubit.authenticate(user);

        await storage.write(key: 'token', value: creds.token);
      } on ApiUnauthenticatedException catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e.e));
      } on ApiInternalServerException catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e.e));
      } on ApiAuthRepositoryLoginException catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e.e));
      } catch (e) {
        print(e);
        yield state.copyWith(formStatus: SubmissionFailed(UnexpectedException(e)));
      }
    }
  }
}
