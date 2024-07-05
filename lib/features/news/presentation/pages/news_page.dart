import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/news/domain/models/responses/breaking_news_response.dart';
import 'package:q_learn/features/news/presentation/providers/news_riverpod_provider.dart';
import 'package:q_learn/features/news/presentation/widgets/ArticleCard.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
      body: const NewsList(),
    );
  }
}

class NewsList extends ConsumerWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<DataState<BreakingNewsResponse>> news =
        ref.watch(newsProvider);

    if (news.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (news.hasError) {
      print(news.error);
      return const Center(
        child: Text('Oops, something unexpected happened'),
      );
    }

    if (news.value is DataFailed) {
      print(news.value?.error);
      return Center(
        child: Text(news.value?.error?.response?.data?['message'] ??
            'Oops, something unexpected happened'),
      );
    }

    return Center(
      child: ListView.builder(
        itemCount: news.value?.data?.articles.length ?? 0,
        itemBuilder: (context, index) =>
            ArticleCard(article: news.value!.data!.articles[index]),
      ),
    );
  }
}
