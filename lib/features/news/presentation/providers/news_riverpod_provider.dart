import 'package:q_learn/features/news/domain/models/requests/breaking_news_request.dart';
import 'package:q_learn/features/news/domain/models/responses/breaking_news_response.dart';
import 'package:q_learn/features/news/domain/repositories/news_repository.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';

part 'news_riverpod_provider.g.dart';

@riverpod
Future<DataState<BreakingNewsResponse>> news(NewsRef ref) async {
  final response = await locator<NewsRepository>().getNews(
    request: BreakingNewsRequest(),
  );

  return response;
}
