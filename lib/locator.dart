import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:q_learn/features/auth/data/datasources/remote/auth_datasource.dart';
import 'package:q_learn/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:q_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:q_learn/features/quiz_participation/data/datasources/remote/quiz_datasource.dart';
import 'package:q_learn/features/quiz_participation/data/repositories/quiz_repository_impl.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/quiz_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();

  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  // Registering data sources
  locator.registerSingleton<AuthDatasource>(
    AuthDatasource(locator<Dio>()),
  );
  locator.registerLazySingleton<QuizDatasource>(
    () => QuizDatasource(locator.get<Dio>()),
  );

  // Registering repositories
  locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(locator<AuthDatasource>()),
  );

  locator.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(locator.get<QuizDatasource>()),
  );
}
