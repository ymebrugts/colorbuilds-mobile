import 'package:colorbuilds/infrastructure/services/firebase/analytics_service.dart';

class AuthAnalyticsService extends FirebaseAnalyticsService {
  Future logLogin({required String email, required String username}) async {
    await analytics.logLogin(loginMethod: 'User: $email / $username');
  }
}
