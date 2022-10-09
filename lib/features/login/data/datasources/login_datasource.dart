import 'dart:convert';

import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/login/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginDatasource {
  Future<LoginUserModel> login({
    String email,
    String password,
  });
}

class LoginDatasourceImpl implements LoginDatasource {
  LoginDatasourceImpl({required this.client});
  late final http.Client client;

  @override
  Future<LoginUserModel> login({
    String? email,
    String? password,
  }) async {
    final response = await client.post(
      Uri.parse(
        'http://localhost:5000/login',
      ),
      body: jsonEncode(<String, String>{
        'email': '$email',
        'password': '$password',
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return LoginUserModel.fromJson(json);
    }

    return Future.error(ServerFailure());
  }
}
