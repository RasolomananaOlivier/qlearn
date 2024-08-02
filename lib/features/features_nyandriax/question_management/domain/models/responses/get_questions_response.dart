import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/question.dart';

part 'get_questions_response.g.dart';

@JsonSerializable()
class GetQuestionsResponse {
  final List<Question> questions;

  GetQuestionsResponse({required this.questions});

  factory GetQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetQuestionsResponseToJson(this);
}
