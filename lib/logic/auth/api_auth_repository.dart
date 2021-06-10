import 'dart:convert';

import 'package:colorbuilds/constants/api.dart';
import 'package:colorbuilds/domain/data/models/JWTCredentials.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthRepositoryLoginException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiInternalServerException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiUnauthenticatedException.dart';
import 'package:http/http.dart' as http;
import 'package:colorbuilds/logic/contracts/AbstractApiRepository.dart';

class ApiAuthRepository extends AbstractApiRepository {
  ///
  Future<JWTCredentials> login({
    required String email,
    required String password,
  }) async {
    final String data = jsonEncode({'username': email.trim(), 'password': password.trim()});

    final response = await http.post(
      Uri.parse('$baseUrl/authenticate'),
      body: data,
      headers: ApiConstants.getHeaders,
    );

    final dynamic responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) return JWTCredentials.fromJson(response.body);
    if (response.statusCode == 401) throw ApiUnauthenticatedException(responseBody['message'].toString());
    if (response.statusCode == 500) throw ApiInternalServerException(responseBody['message'].toString());

    throw ApiAuthRepositoryLoginException(responseBody);
  }
}
