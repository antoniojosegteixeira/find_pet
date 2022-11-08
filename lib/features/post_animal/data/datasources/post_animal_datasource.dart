import 'dart:convert';

import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/post_animal/data/models/animal_model.dart';
import 'package:http/http.dart' as http;

abstract class PostAnimalDatasource {
  Future<PostAnimalModel> postAnimal({
    String? name,
    String? sex,
    required String species,
    String? breed,
    required String color,
    String? age,
    String? image,
  });
}

class PostAnimalDatasourceImpl implements PostAnimalDatasource {
  PostAnimalDatasourceImpl({required this.client});
  late final http.Client client;

  @override
  Future<PostAnimalModel> postAnimal({
    String? name,
    String? sex,
    required String species,
    String? breed,
    required String color,
    String? age,
    String? image,
  }) async {
    final response = await client.post(
      Uri.parse(
        'http://192.168.0.4:5000/post-animal',
      ),
      headers: <String, String>{
        'content-type': 'application/json',
        'accept': '*/*',
        'Connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
      },
      body: jsonEncode(<String, String>{
        'name': name!,
        'sex': sex!,
        'species': species,
        'breed': breed!,
        'color': color,
        'age': age!,
        'image': image!,
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return PostAnimalModel.fromJson(json);
    }

    return Future.error(ServerFailure());
  }
}
