import 'package:dio/dio.dart';
import 'package:q_learn/core/utils/constants/strings.dart';
import 'package:q_learn/features/news/domain/models/responses/breaking_news_response.dart';
import 'package:retrofit/retrofit.dart';

part 'news_remote_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewsRemoteDatasource {
  factory NewsRemoteDatasource(Dio dio, {String baseUrl}) =
      _NewsRemoteDatasource;

  @GET("/top-headlines")
  Future<HttpResponse<BreakingNewsResponse>> getBreakingNews({
    @Query("country") String? country = "us",
    @Query("category") String? category = "general",
    @Query("pageSize") int? pageSize,
    @Query("page") int? page,
    // @Query("apiKey") String? apiKey,
    @Header('x-api-key') String? apiKey,
  });
}
