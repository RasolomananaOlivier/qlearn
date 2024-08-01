import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:q_learn/core/common/data/datasources/remote/quizz_category_datasource.dart';
import 'package:q_learn/core/common/data/repositories/quizz_category_repository_impl.dart';
import 'package:q_learn/core/common/domain/repositories/quizz_category_repository.dart';
import 'package:q_learn/features/auth/data/datasources/remote/auth_datasource.dart';
import 'package:q_learn/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:q_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:q_learn/features/quiz_participation/data/datasources/remote/question_datasource.dart';
import 'package:q_learn/features/quiz_participation/data/datasources/remote/quiz_datasource.dart';
import 'package:q_learn/features/quiz_participation/data/repositories/question_repository_impl.dart';
import 'package:q_learn/features/quiz_participation/data/repositories/quiz_repository_impl.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/question_repository.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/quiz_repository.dart';
import 'package:q_learn/features/features_nyandriax/question_management/data/datasources/remote/question_datasource.dart'
    as nyandriax;
import 'package:q_learn/features/features_nyandriax/question_management/domain/repositories/question_repository.dart'
    as nyandriax;
import 'package:q_learn/features/features_nyandriax/question_management/data/repositories/question_repository_impl.dart'
    as nyandriax;

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
  locator.registerLazySingleton<QuestionDatasource>(
    () => QuestionDatasource(locator.get<Dio>()),
  );
  locator.registerLazySingleton<QuizzCategoryDatasource>(
    () => QuizzCategoryDatasource(locator.get<Dio>()),
  );
  locator.registerLazySingleton<nyandriax.QuestionDatasource>(
    () => nyandriax.QuestionDatasource(locator.get<Dio>()),
  );

  // Registering repositories
  locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(locator<AuthDatasource>()),
  );
  locator.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(locator.get<QuizDatasource>()),
  );
  locator.registerLazySingleton<QuestionRepository>(
    () => QuestionRepositoryImpl(locator.get<QuestionDatasource>()),
  );
  locator.registerLazySingleton<QuizzCategoryRepository>(
    () => QuizzCategoryRepositoryImpl(locator.get<QuizzCategoryDatasource>()),
  );
  locator.registerLazySingleton<nyandriax.QuestionRepository>(
    () => nyandriax.QuestionRepositoryImpl(
      locator.get<nyandriax.QuestionDatasource>(),
    ),
  );
}
