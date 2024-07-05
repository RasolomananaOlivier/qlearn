import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/news/data/datasources/remote/news_remote_datasource.dart';
import 'package:q_learn/features/news/domain/models/requests/breaking_news_request.dart';
import 'package:q_learn/features/news/domain/models/responses/breaking_news_response.dart';
import 'package:q_learn/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends BaseRepository implements NewsRepository {
  final NewsRemoteDatasource _newsRemoteDatasource;

  NewsRepositoryImpl(this._newsRemoteDatasource);

  @override
  Future<DataState<BreakingNewsResponse>> getNews({
    required BreakingNewsRequest request,
  }) {
    return getStateOf(
      request: () => _newsRemoteDatasource.getBreakingNews(
        apiKey: request.apiKey,
        country: request.country,
        category: request.category,
        page: request.page,
        pageSize: request.pageSize,
      ),
    );
  }
}
