import 'package:dio/dio.dart' hide Headers;
import 'package:q_learn/core/utils/constants/strings.dart';
import 'package:q_learn/features/features_nyandriax/category_management/domain/models/requests/create_category_request.dart';
import 'package:q_learn/features/features_nyandriax/category_management/domain/models/responses/get_categories_response.dart';
import 'package:retrofit/retrofit.dart';

part 'category_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class CategoryDatasource {
  factory CategoryDatasource(Dio dio, {String baseUrl}) = _CategoryDatasource;

  @GET('/categories')
  Future<HttpResponse<GetCategoriesResponse>> getCategories();

  @POST('/categories')
  Future<HttpResponse<void>> createCategory(@Body() CreateCategoryRequest body);
}
