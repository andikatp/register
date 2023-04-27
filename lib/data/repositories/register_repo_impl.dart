import 'package:register_dicoding/data/datasources/register_datasource.dart';
import 'package:register_dicoding/data/exceptions/exceptions.dart';
import 'package:register_dicoding/domain/entities/register_entity.dart';
import 'package:register_dicoding/domain/Failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:register_dicoding/domain/repositories/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final RegisterDataSource registerDataSource = RegisterDataSourceImpl();

  @override
  Future<Either<Failure, RegisterEntity>> registerFromApi(
      String name, String email, String password) async {
    try {
      final result = await registerDataSource.registerAccountFromDatasource(
          name, email, password);
      return right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
