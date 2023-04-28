import 'package:dartz/dartz.dart';
import 'package:register_dicoding/domain/Failures/failures.dart';
import 'package:register_dicoding/domain/entities/register_entity.dart';
import 'package:register_dicoding/domain/repositories/register_repo.dart';

class RegisterUsecase {
  RegisterRepo registerRepo;
  RegisterUsecase({required this.registerRepo});

  Future<Either<Failure, RegisterEntity>> onRegister(
      String name, String email, String password) async {
    return registerRepo.registerFromApi(name, email, password);
  }
}
