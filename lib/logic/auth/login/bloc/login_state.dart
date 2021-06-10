import '../../../form_submission_status.dart';

class LoginState {
  final String email;
  final String password;
  final FormSubmissionStatus formStatus;

  LoginState({
    required this.email,
    required this.password,
    required this.formStatus,
  });

  LoginState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class LoginInitial extends LoginState {
  LoginInitial()
      : super(
          email: '',
          password: '',
          formStatus: const InitialFormStatus(),
        );
}
