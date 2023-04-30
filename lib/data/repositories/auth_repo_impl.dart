import 'package:register_dicoding/data/datasources/auth_datasource.dart';
import 'package:register_dicoding/data/exceptions/exceptions.dart';
import 'package:register_dicoding/domain/entities/login_entity.dart';
import 'package:register_dicoding/domain/entities/register_entity.dart';
import 'package:register_dicoding/domain/Failures/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource authDataSource;
  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Either<Failure, RegisterEntity>> registerFromApi(
      String name, String email, String password) async {
    try {
      final result = await authDataSource.registerAccountFromDatasource(
          name, email, password);
      return right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> loginFromApi(
      String email, String password) async {
    try {
      final result =
          await authDataSource.loginAccountFromDatasource(email, password);
      return right(result);
    } on ServerExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
