import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final bool error;
  final String message;
  final LoginResult loginResult;

  const LoginEntity(
      {required this.error, required this.message, required this.loginResult});

  @override
  List<Object?> get props => [error, message, loginResult];
}

abstract class LoginResult extends Equatable {
  final String userId;
  final String name;
  final String token;
  const LoginResult(
      {required this.userId, required this.name, required this.token});

  @override
  List<Object?> get props => [userId, name, token];
}
