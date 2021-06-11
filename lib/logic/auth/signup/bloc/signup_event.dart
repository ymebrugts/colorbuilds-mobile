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
