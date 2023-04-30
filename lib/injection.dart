import 'package:get_it/get_it.dart';
import 'package:register_dicoding/domain/repositories/auth_repo.dart';
import 'package:register_dicoding/domain/usecases/auth_usecase.dart';
import 'package:register_dicoding/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:http/http.dart' as http;
import 'data/datasources/auth_datasource.dart';
import 'data/repositories/auth_repo_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ! presentation layer
  sl.registerFactory(() => AuthCubit(authUsecase: sl()));

  // ! domain layer
  sl.registerFactory(() => AuthUsecase(authRepo: sl()));

  // ! data layer
  sl.registerFactory<AuthRepo>(() => AuthRepoImpl(authDataSource: sl()));

  sl.registerFactory<AuthDataSource>(() => AuthDataSourceImpl(client: sl()));

  // ! external
  sl.registerFactory(() => http.Client());
}
