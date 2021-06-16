import 'package:bloc/bloc.dart';
import 'package:colorbuilds/domain/data/models/User.dart';
import 'package:equatable/equatable.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(InitialSession());

  /// [SessionState] makes [InitialSession]
  void initialize() => emit(InitialSession());

  /// Takes authenticated [user]
  ///
  /// [SessionState] makes [AuthenticatedSession]
  void authenticate(User user) => emit(AuthenticatedSession(user: user));

  /// [SessionState] makes [UnauthenticatedSession]
  void unauthenticate() => emit(UnauthenticatedSession());
}
