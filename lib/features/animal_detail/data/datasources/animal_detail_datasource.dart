import 'dart:convert';

import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/animal_detail/data/models/animal_detail_model.dart';
import 'package:http/http.dart' as http;

abstract class AnimalDetailDatasource {
  Future<AnimalDetailModel> getAnimal({required String id});
}

class AnimalDetailDatasourceImpl implements AnimalDetailDatasource {
  AnimalDetailDatasourceImpl({required this.client});
  late final http.Client client;

  @override
  Future<AnimalDetailModel> getAnimal({
    required String id,
  }) async {
    final response = await client.get(
      Uri.parse(
        'http://192.168.15.20:8000/posts/$id',
      ),
      headers: <String, String>{
        'content-type': 'application/json',
        'accept': '*/*',
        'Connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return AnimalDetailModel.fromJson(json);
    }

    return Future.error(ServerFailure());
  }
}
