// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breaking_news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreakingNewsResponse _$BreakingNewsResponseFromJson(
        Map<String, dynamic> json) =>
    BreakingNewsResponse(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toInt(),
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BreakingNewsResponseToJson(
        BreakingNewsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
