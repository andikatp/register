import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:register_dicoding/data/exceptions/exceptions.dart';
import 'package:register_dicoding/data/models/login_model.dart';
import '../models/register_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthDataSource {
  Future<RegisterModel> registerAccountFromDatasource(
      String name, String email, String password);
  Future<LoginModel> loginAccountFromDatasource(String email, String password);
}

class AuthDataSourceImpl implements AuthDataSource {
  final http.Client client;
  const AuthDataSourceImpl({required this.client});

  @override
  Future<RegisterModel> registerAccountFromDatasource(
      String name, String email, String password) async {
    final response = await client.post(
        Uri.parse('https://story-api.dicoding.dev/v1/register'),
        body: {'name': name, 'email': email, 'password': password});
    final decode = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return RegisterModel.fromJson(decode);
    }
    throw ServerExceptions(message: decode['message']);
  }

  @override
  Future<LoginModel> loginAccountFromDatasource(
      String email, String password) async {
    final response = await client.post(
        Uri.parse('https://story-api.dicoding.dev/v1/login'),
        body: {'email': email, 'password': password});
    final decode = jsonDecode(response.body);
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return LoginModel.fromJson(decode);
    }
    throw ServerExceptions(message: decode['message']);
  }
}
