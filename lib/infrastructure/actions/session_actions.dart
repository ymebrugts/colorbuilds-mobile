import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionActions {
  ///
  Future<void> unauthenticate({required SessionCubit cubit}) async {
    final storage = FlutterSecureStorage();
    cubit.unauthenticate();
    await storage.delete(key: 'token');
  }
}
