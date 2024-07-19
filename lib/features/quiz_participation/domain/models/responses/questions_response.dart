import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/features/question_management/domain/models/question.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';

part 'questions_response.g.dart';

@JsonSerializable()
class QuestionsResponse {
  final List<Question> questions;

  QuestionsResponse({required this.questions});

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}
