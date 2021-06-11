import '../../../form_submission_status.dart';

class SignupState {
  final String email;
  final String password;
  final String username;
  final FormSubmissionStatus formStatus;

  SignupState({
    required this.email,
    required this.username,
    required this.password,
    required this.formStatus,
  });

  SignupState copyWith({
    String? email,
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return SignupState(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class SignupInitial extends SignupState {
  SignupInitial()
      : super(
          email: '',
          username: '',
          password: '',
          formStatus: const InitialFormStatus(),
        );
}
