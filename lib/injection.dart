import 'package:get_it/get_it.dart';
import 'package:register_dicoding/data/datasources/register_datasource.dart';
import 'package:register_dicoding/data/repositories/register_repo_impl.dart';
import 'package:register_dicoding/domain/repositories/register_repo.dart';
import 'package:register_dicoding/domain/usecases/register_usecase.dart';
import 'package:register_dicoding/presentation/pages/register/cubit/register_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // ! presentation layer
  sl.registerFactory(() => RegisterCubit(registerUsecase: sl()));

  // ! domain layer
  sl.registerFactory(() => RegisterUsecase(registerRepo: sl()));

  // ! data layer
  sl.registerFactory<RegisterRepo>(
      () => RegisterRepoImpl(registerDataSource: sl()));

  sl.registerFactory<RegisterDataSource>(
      () => RegisterDataSourceImpl(client: sl()));

  // ! external
  sl.registerFactory(() => http.Client());
}
