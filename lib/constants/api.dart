class ApiConstants {
  static const String BASE_URL = 'http://api.colorbuilds.com:443'; // 'http://localhost:8083';

  static String getAuthorization(String token) => 'Bearer $token';

  static Map<String, String> get getHeaders => {'Content-Type': 'application/json'};
}
