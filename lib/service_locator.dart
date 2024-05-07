import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance;

Future<void> initLocator() async {
  // sl.registerFactory(() => SignUpCubit(sl()));

  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //     () => AuthRemoteDataSourceImpl(sl(), sl()));





  final sharedPrefences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefences);
  sl.registerLazySingleton(() => Dio());
}
