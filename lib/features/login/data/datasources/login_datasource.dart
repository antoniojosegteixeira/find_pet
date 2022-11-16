import 'dart:convert';

import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/core/hive/services/session.service.dart';
import 'package:find_pet/features/login/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginDatasource {
  Future<UserModel> login({
    String email,
    String password,
  });
}

class LoginDatasourceImpl implements LoginDatasource {
  LoginDatasourceImpl({required this.client});
  late final http.Client client;

  @override
  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    final response = await client.post(
      Uri.parse(
        'http://192.168.15.20:8000/auth/login/',
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
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final userModel = UserModel.fromJson(json);

      SessionService.sessionRegister(userModel);

      return userModel;
    }

    return Future.error(ServerFailure());
  }
}
