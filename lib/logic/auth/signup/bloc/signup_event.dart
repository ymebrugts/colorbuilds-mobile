abstract class SignupEvent {}

class SignupSubmitted extends SignupEvent {
  final String email;
  final String username;
  final String password;

  SignupSubmitted({
    required this.email,
    required this.username,
    required this.password,
  });
}

class SignupEmailSubmitted extends SignupEvent {
  final String email;
  SignupEmailSubmitted(this.email);
}

class SignupUsernameSubmitted extends SignupEvent {
  final String username;
  SignupUsernameSubmitted(this.username);
}
