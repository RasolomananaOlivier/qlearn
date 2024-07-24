import 'package:json_annotation/json_annotation.dart';

part 'quizzes_request.g.dart';

@JsonSerializable()
class QuizzesRequest {
  final List<int>? categoryIds;
  final int? difficulty;
  final String? keyword;

  QuizzesRequest({
    this.categoryIds,
    this.difficulty,
    this.keyword,
  });

  factory QuizzesRequest.fromJson(Map<String, dynamic> json) =>
      _$QuizzesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QuizzesRequestToJson(this);

  Map<String, dynamic> toQueries() {
    Map<String, dynamic> queries = {};

    if (difficulty != null) {
      queries['difficulty[eq]'] = difficulty;
    }

    if (categoryIds != null && categoryIds!.isNotEmpty) {
      if (categoryIds!.length == 1) {
        queries['categoryId[eq]'] = categoryIds!.first;
      } else {
        queries['categoryId[in]'] = categoryIds;
      }
    }

    if (keyword != null) {
      queries['name[contains]'] = keyword;
      queries['description[contains]'] = keyword;
    }

    return queries;
  }
}
