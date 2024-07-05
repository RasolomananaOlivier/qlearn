import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/news/domain/models/requests/breaking_news_request.dart';
import 'package:q_learn/features/news/domain/models/responses/breaking_news_response.dart';

abstract class NewsRepository {
  Future<DataState<BreakingNewsResponse>> getNews({
    required BreakingNewsRequest request,
  });
}
