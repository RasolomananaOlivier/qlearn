import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/question.dart';

part 'questions_response.g.dart';

@JsonSerializable()
class QuestionsResponse {
  final List<Question> questions;

  QuestionsResponse({required this.questions});

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}
