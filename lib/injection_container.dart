// lib/injection_container.dart
import 'package:get_it/get_it.dart';
import 'features/user/data/datasources/user_remote_data_source.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'features/user/domain/usecases/get_user.dart';
import 'features/user/presentation/bloc/user_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init() {
  // external
  sl.registerLazySingleton(() => http.Client());
  // datasource
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));
  // repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl()));
  // uescase
  sl.registerLazySingleton(() => GetUser(sl()));
  // bloc
  sl.registerFactory(() => UserBloc(sl()));
}
