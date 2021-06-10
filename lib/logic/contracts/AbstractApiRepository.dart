import 'package:colorbuilds/constants/api.dart';

abstract class AbstractApiRepository {
  final String baseUrl = Uri.parse(ApiConstants.BASE_URL).toString();
}
