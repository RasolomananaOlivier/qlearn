import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/question.dart';

part 'create_question_response.g.dart';

@JsonSerializable()
class CreateQuestionResponse {
  final Question question;

  CreateQuestionResponse({required this.question});

  factory CreateQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateQuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateQuestionResponseToJson(this);
}
