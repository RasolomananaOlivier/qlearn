import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:q_learn/features/news/data/datasources/remote/news_remote_datasource.dart';
import 'package:q_learn/features/news/data/repositories/news_repository_impl.dart';
import 'package:q_learn/features/news/domain/repositories/news_repository.dart';
import 'package:q_learn/features/quiz_participation/data/repositories/quiz_repository_impl.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/quiz_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();

  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<NewsRemoteDatasource>(
    NewsRemoteDatasource(locator<Dio>()),
  );

  locator.registerSingleton<NewsRepository>(
    NewsRepositoryImpl(locator<NewsRemoteDatasource>()),
  );

  locator.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(),
  );
}
