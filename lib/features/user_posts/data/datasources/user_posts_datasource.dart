import 'dart:convert';

import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/user_posts/data/models/user_posts_page_model.dart';
import 'package:http/http.dart' as http;

abstract class UserPostsDatasource {
  Future<UserPostsPageModel> getUserPosts({
    String? name,
    String? sex,
    required String species,
    String? breed,
    required String color,
    String? age,
  });
}

class UserPostsDatasourceImpl implements UserPostsDatasource {
  UserPostsDatasourceImpl({required this.client});
  late final http.Client client;

  @override
  Future<UserPostsPageModel> getUserPosts({
    String? name,
    String? sex,
    String? species,
    String? breed,
    String? color,
    String? age,
  }) async {
    final response = await client.get(
      Uri.parse(
        'http://192.168.15.20:8000/posts/current-user/',
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
      return UserPostsPageModel.fromJson(json);
    }

    return Future.error(ServerFailure());
  }
}
