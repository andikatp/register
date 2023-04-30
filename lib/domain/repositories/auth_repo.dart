import 'package:dartz/dartz.dart';
import 'package:register_dicoding/domain/Failures/failures.dart';
import 'package:register_dicoding/domain/entities/login_entity.dart';
import 'package:register_dicoding/domain/entities/register_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterEntity>> registerFromApi(
      String name, String email, String password);

  Future<Either<Failure, LoginEntity>> loginFromApi(
      String email, String password);
}
