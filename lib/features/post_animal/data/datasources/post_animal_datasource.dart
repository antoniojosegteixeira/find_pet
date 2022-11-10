import 'dart:convert';

import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/core/hive/services/session.service.dart';
import 'package:find_pet/features/post_animal/data/models/animal_model.dart';
import 'package:http/http.dart' as http;

abstract class PostAnimalDatasource {
  Future<PostAnimalModel> postAnimal({
    String? name,
    String? age,
    String? sex,
    required String species,
    String? breed,
    required String color,
    required String contact,
    required String city,
    required String countrystate,
    required String address,
    required String postType,
  });
}

class PostAnimalDatasourceImpl implements PostAnimalDatasource {
  PostAnimalDatasourceImpl({required this.client});
  late final http.Client client;

  @override
  Future<PostAnimalModel> postAnimal({
    String? name,
    String? age,
    String? sex,
    required String species,
    String? breed,
    required String color,
    required String contact,
    required String city,
    required String countrystate,
    required String address,
    required String postType,
  }) async {
    final sessionBox = SessionService.getSession();

    print(species);

    final response = await client.post(
      Uri.parse(
        'http://192.168.15.20:8000/posts/create/',
      ),
      headers: <String, String>{
        'content-type': 'application/json',
        'accept': '*/*',
        'Connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
        'Authorization': 'Bearer ${sessionBox.sessionToken}',
      },
      body: jsonEncode(<String, String>{
        'name': name!,
        'age': age!,
        'sex': sex!,
        'species': species,
        'breed': breed!,
        'color': color,
        'contact': contact,
        'city': city,
        'state': countrystate,
        'address': address,
        'post_type': postType,
      }),
    );

    final response2 = response;

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final model = PostAnimalModel.fromJson(json);
      return model;
    }

    return Future.error(ServerFailure());
  }
}
