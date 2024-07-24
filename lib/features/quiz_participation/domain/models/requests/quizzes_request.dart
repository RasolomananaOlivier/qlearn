import 'package:json_annotation/json_annotation.dart';

part 'quizzes_request.g.dart';

@JsonSerializable()
class QuizzesRequest {
  final int? categoryId;
  final int? difficulty;

  QuizzesRequest({
    this.categoryId,
    this.difficulty,
  });

  factory QuizzesRequest.fromJson(Map<String, dynamic> json) =>
      _$QuizzesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QuizzesRequestToJson(this);
}
