import 'dart:convert';

import 'package:register_dicoding/data/exceptions/exceptions.dart';

import '../models/register_model.dart';
import 'package:http/http.dart' as http;

abstract class RegisterDataSource {
  Future<RegisterModel> registerAccountFromDatasource(
      String name, String email, String password);
}

class RegisterDataSourceImpl implements RegisterDataSource {
  @override
  Future<RegisterModel> registerAccountFromDatasource(
      String name, String email, String password) async {
    final response = await http.post(
        Uri.parse('https://story-api.dicoding.dev/v1/register'),
        body: {'name': name, 'email': email, 'password': password});
    final decode = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return RegisterModel.fromJson(decode);
    }
    throw ServerExceptions(message: decode['message']);
  }
}
