import 'dart:convert';

import 'package:colorbuilds/constants/api.dart';
import 'package:colorbuilds/domain/data/models/JWTCredentials.dart';
import 'package:colorbuilds/domain/data/models/SuccessResponse.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthRepositoryCheckEmailExistenceException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthRepositoryCheckUsernameExistenceException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthRepositoryLoginException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthInternalServerException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiAuthRepositorySignupException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiUnauthenticatedException.dart';
import 'package:colorbuilds/presentation/extensions/string_extensions.dart';
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
      headers: ApiConstants.getHeaders,
      body: data,
    );

    final dynamic responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) return JWTCredentials.fromJson(response.body);
    if (response.statusCode == 401) throw ApiUnauthenticatedException(responseBody['message'].toString());
    if (response.statusCode == 500) throw ApiAuthInternalServerException(responseBody['message'].toString());

    throw ApiAuthRepositoryLoginException(responseBody);
  }

  ///
  Future<SuccessResponse> signup({
    required String email,
    required String username,
    required String password,
  }) async {
    final String data = jsonEncode({'email': email.trim(), 'username': username.trim(), 'password': password.trim()});

    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: ApiConstants.getHeaders,
      body: data,
    );

    dynamic responseBody;
    if (response.body.isNotEmpty) {
      responseBody = jsonDecode(response.body);
    }
    if (response.statusCode == 200) return SuccessResponse(message: 'Registered Successfully!');
    if (response.statusCode == 500) throw ApiAuthInternalServerException(responseBody['message'].toString());

    throw ApiAuthRepositorySignupException(responseBody);
  }

  ///
  Future<bool> checkEmailExistence({required String email}) async {
    final response = await http.get(Uri.parse('$baseUrl/register/email/$email'));

    dynamic responseBody;
    if (response.body.isNotEmpty) {
      responseBody = jsonDecode(response.body);
    }

    if (response.statusCode == 200) return response.body.toString().parseBool;
    if (response.statusCode == 500) throw ApiAuthInternalServerException(responseBody['message'].toString());

    throw ApiAuthRepositoryCheckEmailExistenceException(responseBody);
  }

  ///
  Future<bool> checkUsernameExistence({required String username}) async {
    final response = await http.get(Uri.parse('$baseUrl/register/username/$username'));

    dynamic responseBody;
    if (response.body.isNotEmpty) {
      responseBody = jsonDecode(response.body);
    }

    if (response.statusCode == 200) return response.body.toString().parseBool;
    if (response.statusCode == 500) throw ApiAuthInternalServerException(responseBody['message'].toString());

    throw ApiAuthRepositoryCheckUsernameExistenceException(responseBody);
  }
}
