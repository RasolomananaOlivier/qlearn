import 'package:json_annotation/json_annotation.dart';

part 'quizzes_request.g.dart';

@JsonSerializable()
class QuizzesRequest {
  final List<int>? categoryIds;
  final int? difficulty;

  QuizzesRequest({
    this.categoryIds,
    this.difficulty,
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

    return queries;
  }
}
