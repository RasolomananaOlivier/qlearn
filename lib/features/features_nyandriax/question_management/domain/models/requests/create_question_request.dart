import 'package:json_annotation/json_annotation.dart';

part 'create_question_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateQuestionRequest {
  final String? content;
  final int? quizId;
  final List<Answer>? answers;

  CreateQuestionRequest({
    this.content,
    this.quizId,
    this.answers,
  });

  factory CreateQuestionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateQuestionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateQuestionRequestToJson(this);
}

@JsonSerializable()
class Answer {
  final String content;
  final bool isCorrect;

  Answer({
    required this.content,
    required this.isCorrect,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
