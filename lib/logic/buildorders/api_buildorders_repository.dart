import 'dart:convert';

import 'package:colorbuilds/constants/api.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiBuildordersRepositoryIndexException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiBuildordersRepositoryInternalServerException.dart';
import 'package:http/http.dart' as http;
import 'package:colorbuilds/domain/data/models/Buildorder.dart';
import 'package:colorbuilds/logic/contracts/AbstractApiRepository.dart';

class ApiBuildOrdersRepository extends AbstractApiRepository {
  late String _baseUrl;

  ApiBuildOrdersRepository() {
    _baseUrl = '$baseUrl/build';
  }

  Future<List<Buildorder>?> index({required String token}) async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {'Authorization': ApiConstants.getAuthorization(token)},
    );

    final dynamic responseBody = jsonDecode(response.body);

    if (response.statusCode == 200 && responseBody is Iterable<dynamic>) {
      return List<Buildorder>.from(
        responseBody.map<Buildorder>((dynamic model) => Buildorder.fromJson(jsonEncode(model))),
      );
    }
    if (response.statusCode == 500)
      throw ApiBuildordersRepositoryInternalServerException(responseBody['message'].toString());

    throw ApiBuildordersRepositoryIndexException(responseBody);
  }
}
