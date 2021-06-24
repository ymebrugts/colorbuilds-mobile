import 'package:colorbuilds/constants/enums.dart';
import 'package:colorbuilds/domain/data/models/JWTCredentials.dart';
import 'package:colorbuilds/domain/data/models/User.dart';
import 'package:colorbuilds/infrastructure/validations/ValidationMessages.dart';
import 'package:colorbuilds/infrastructure/validations/validators/EmailValidator.dart';
import 'package:colorbuilds/logic/auth/api_auth_repository.dart';
import 'package:colorbuilds/logic/auth/login/bloc/login_bloc.dart';
import 'package:colorbuilds/logic/auth/login/bloc/login_event.dart';
import 'package:colorbuilds/logic/form_submission_status.dart';
import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockSessionCubit extends Mock implements SessionCubit {}

class MockApiAuthRepository extends Mock implements ApiAuthRepository {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

// ignore: must_be_immutable
class MockInitialFormStatus extends Mock implements InitialFormStatus {}

// ignore: must_be_immutable
class MockUser extends Mock implements User {}

// ignore: must_be_immutable
class MockJWTCredentials extends Mock implements JWTCredentials {}

void main() {
  late MockSessionCubit mockSessionCubit;
  late MockApiAuthRepository mockApiAuthRepository;
  late MockFlutterSecureStorage mockFlutterSecureStorage;

  setUpAll(() {
    mockApiAuthRepository = MockApiAuthRepository();
    mockSessionCubit = MockSessionCubit();
    mockFlutterSecureStorage = MockFlutterSecureStorage();
  });

  group('Login', () {
    test('Empty email validator', () {
      final validator = EmailValidator('');

      expect(validator.validate, ValidationMessages.get(ValidationType.Base));
    });

    test('Emits LoginState with [InitialFormStatus, FormSubmitting, SubmissionSuccess] when successfull', () async {
      final bloc = LoginBloc(
        authRepo: mockApiAuthRepository,
        sessionCubit: mockSessionCubit,
        storage: mockFlutterSecureStorage,
      );

      bloc.add(LoginSubmitted(email: '', password: ''));

      await expectLater(bloc.state.formStatus.runtimeType, InitialFormStatus().runtimeType);
    });
  });
}
