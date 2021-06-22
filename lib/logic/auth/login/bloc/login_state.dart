import 'package:equatable/equatable.dart';

import '../../../form_submission_status.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final FormSubmissionStatus formStatus;

  const LoginState({
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

  @override
  List<Object?> get props => [formStatus];
}

class LoginInitial extends LoginState {
  const LoginInitial()
      : super(
          email: '',
          password: '',
          formStatus: const InitialFormStatus(),
        );
}
