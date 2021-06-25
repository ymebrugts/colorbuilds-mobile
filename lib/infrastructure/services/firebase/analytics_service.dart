import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class FirebaseAnalyticsService {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver get getObserver => FirebaseAnalyticsObserver(analytics: analytics);

  Future logScreen({required String name}) async {
    await analytics.setCurrentScreen(screenName: name);
  }

  Future logEvent({required String name, Map<String, Object?>? parameters}) async {
    await analytics.logEvent(name: name, parameters: parameters);
  }
}
