import 'package:dartz/dartz.dart';
import 'package:register_dicoding/domain/Failures/failures.dart';
import 'package:register_dicoding/domain/entities/register_entity.dart';

import '../entities/login_entity.dart';
import '../repositories/auth_repo.dart';

class AuthUsecase {
  AuthRepo authRepo;
  AuthUsecase({required this.authRepo});

  Future<Either<Failure, RegisterEntity>> onRegister(
      String name, String email, String password) async {
    return authRepo.registerFromApi(name, email, password);
  }

  Future<Either<Failure, LoginEntity>> onLogin(
      String email, String password) async {
    return authRepo.loginFromApi(email, password);
  }
}
