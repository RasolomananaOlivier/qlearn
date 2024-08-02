import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/answer.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final int id;
  final String content;
  final List<Answer> answers;

  Question({
    required this.id,
    required this.content,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  String toString() {
    return 'Question{id: $id, content: $content, answers: $answers}';
  }
}
