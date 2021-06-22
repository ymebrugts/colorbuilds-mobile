part of 'session_cubit.dart';

abstract class SessionState extends Equatable {}

class InitialSession extends SessionState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedSession implements SessionState {
  final User user;
  const AuthenticatedSession({required this.user});

  @override
  List<Object?> get props => [user];

  @override
  bool? get stringify => true;
}

class UnauthenticatedSession extends SessionState {
  @override
  List<Object?> get props => [];
}
