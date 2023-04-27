import 'package:dartz/dartz.dart';
import 'package:register_dicoding/domain/Failures/failures.dart';
import 'package:register_dicoding/domain/entities/register_entity.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterEntity>> registerFromApi(
      String name, String email, String password);
}
