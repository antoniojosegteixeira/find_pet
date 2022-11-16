import 'dart:convert';

import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/list_animals/data/models/list_animals_page_model.dart';
import 'package:http/http.dart' as http;

abstract class ListAnimalsDatasource {
  Future<ListAnimalsPageModel> listAnimals({
    String? name,
    String? sex,
    required String species,
    String? breed,
    required String color,
    String? age,
  });
}

class ListAnimalsDatasourceImpl implements ListAnimalsDatasource {
  ListAnimalsDatasourceImpl({required this.client});
  late final http.Client client;

  @override
  Future<ListAnimalsPageModel> listAnimals({
    String? name,
    String? sex,
    String? species,
    String? breed,
    String? color,
    String? age,
  }) async {
    final response = await client.get(
      Uri.parse(
        'http://192.168.15.20:8000/posts/',
      ),
      headers: <String, String>{
        'content-type': 'application/json',
        'accept': '*/*',
        'Connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
      },
      /*
      body: jsonEncode(<String, String>{
        'name': name!,
        'sex': sex!,
        'species': species,
        'breed': breed!,
        'color': color,
        'age': age!,
      }),
      */
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return ListAnimalsPageModel.fromJson(json);
    }

    return Future.error(ServerFailure());
  }
}
