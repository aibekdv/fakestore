import 'package:dio/dio.dart';
import 'package:fakestore/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fakestore/features/auth/domain/repositories/auth_repository.dart';
import 'package:fakestore/features/category/presentation/cubit/category/category_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/category/data/datasources/category_remote_datasource.dart';
import 'features/category/data/repositories/category_repository_impl.dart';
import 'features/category/domain/repositories/category_repository.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  sl.registerFactory(() => CategoryCubit(sl()));
  sl.registerFactory(() => AuthCubit(sl()));

  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(sl()));
  sl.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl(), sl()));

  final sharedPrefences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefences);
  sl.registerLazySingleton(() => Dio(
        BaseOptions(baseUrl: 'https://fakestoreapi.com/'),
      ));
}
