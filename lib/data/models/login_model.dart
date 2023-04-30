import 'package:equatable/equatable.dart';
import 'package:register_dicoding/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity with EquatableMixin {
  const LoginModel(
      {required bool error,
      required String message,
      required LoginResult loginResult})
      : super(error: error, message: message, loginResult: loginResult);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      error: json['error'],
      message: json['message'],
      loginResult: LoginResultModel.fromJson(json['loginResult']),
    );
  }
}

class LoginResultModel extends LoginResult with EquatableMixin {
  const LoginResultModel(
      {required String userId, required String name, required String token})
      : super(userId: userId, name: name, token: token);

  factory LoginResultModel.fromJson(Map<String, dynamic> json) {
    return LoginResultModel(
        userId: json['userId'], name: json['name'], token: json['token']);
  }
}
