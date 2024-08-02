import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/answer.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final int id;
  final String content;
  final List<Answer> answers;

  @JsonKey(name: '_count')
  final QuestionCount? count;

  Question({
    required this.id,
    required this.content,
    required this.answers,
    this.count,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  String toString() {
    return 'Question{id: $id, content: $content, answers: $answers}';
  }
}

@JsonSerializable()
class QuestionCount {
  final int count;
  final int success;
  final double rate;

  QuestionCount({
    required this.count,
    required this.success,
    required this.rate,
  });

  factory QuestionCount.fromJson(Map<String, dynamic> json) =>
      _$QuestionCountFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionCountToJson(this);
}
