import 'package:dio/dio.dart' hide Headers;
import 'package:q_learn/core/common/domain/models/responses/quizz_categories_response.dart';
import 'package:q_learn/core/utils/constants/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'quizz_category_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class QuizzCategoryDatasource {
  factory QuizzCategoryDatasource(Dio dio, {String baseUrl}) =
      _QuizzCategoryDatasource;

  @GET('/categories')
  Future<HttpResponse<QuizzCategoriesResponse>> getQuizzCategories();
}
