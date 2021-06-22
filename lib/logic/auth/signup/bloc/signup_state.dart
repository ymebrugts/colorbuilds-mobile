import '../../../form_submission_status.dart';

class SignupState {
  final String email;
  final String password;
  final String username;
  final FormSubmissionStatus formStatus;

  final bool emailExists;
  final bool usernameExists;

  SignupState({
    required this.email,
    required this.username,
    required this.password,
    required this.formStatus,
    required this.emailExists,
    required this.usernameExists,
  });

  SignupState copyWith({
    String? email,
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
    bool? emailExists,
    bool? usernameExists,
  }) {
    return SignupState(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
      emailExists: emailExists ?? this.emailExists,
      usernameExists: usernameExists ?? this.usernameExists,
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
          emailExists: false,
          usernameExists: false,
        );
}
