import 'dart:convert';

import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/register/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class RegisterDatasource {
  Future<RegisterUserModel> registerUser({
    String email,
    String password,
    String firstName,
    String lastName,
  });
}

class RegisterDatasourceImpl implements RegisterDatasource {
  RegisterDatasourceImpl({required this.client});
  late final http.Client client;

  @override
  Future<RegisterUserModel> registerUser({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) async {
    final response = await client.post(
      Uri.parse(
        'http://192.168.0.4:5000/register',
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
        'firstName': '$firstName',
        'lastName': '$lastName'
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return RegisterUserModel.fromJson(json);
    }

    return Future.error(ServerFailure());
  }
}
