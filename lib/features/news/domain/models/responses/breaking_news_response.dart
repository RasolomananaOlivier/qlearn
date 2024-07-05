import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/features/news/domain/models/article.dart';

part 'breaking_news_response.g.dart';

@JsonSerializable()
class BreakingNewsResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  BreakingNewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory BreakingNewsResponse.fromJson(Map<String, dynamic> json) =>
      _$BreakingNewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreakingNewsResponseToJson(this);
}
