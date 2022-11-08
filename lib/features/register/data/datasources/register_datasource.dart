import 'dart:convert';

import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/register/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class RegisterDatasource {
  Future<RegisterUserModel> registerUser({
    String email,
    String password,
    String username,
    String city,
    String state,
    String country,
  });
}

class RegisterDatasourceImpl implements RegisterDatasource {
  RegisterDatasourceImpl({required this.client});
  late final http.Client client;

  @override
  Future<RegisterUserModel> registerUser({
    String? email,
    String? password,
    String? username,
    String? city,
    String? state,
    String? country,
  }) async {
    final response = await client.post(
      Uri.parse(
        'http://192.168.15.20:8000/auth/signup/',
      ),
      headers: <String, String>{
        'content-type': 'application/json',
        'accept': '*/*',
        'Connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
      },
      body: jsonEncode(<String, String>{
        'email': '$email',
        'password': '$password',
        'username': '$username',
        'city': '$city',
        'state': '$state',
        'country': '$country',
      }),
    );

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final user = RegisterUserModel.fromJson(json);
      return user;
    }

    return Future.error(ServerFailure());
  }
}
