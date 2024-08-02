import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/question.dart';

part 'quiz.g.dart';

@JsonSerializable()
class Quiz {
  final int id;
  final String name;
  final String description;
  final double difficulty;
  List<Question> questions;

  @JsonKey(name: '_count')
  final QuizCount? count;

  Quiz({
    required this.id,
    required this.name,
    required this.description,
    this.questions = const [],
    this.difficulty = 1,
    this.count,
  });

  void setQuestions(List<Question> questions) {
    this.questions = questions;
  }

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class QuizCount {
  final int quizzes;

  QuizCount({required this.quizzes});

  factory QuizCount.fromJson(Map<String, dynamic> json) =>
      _$QuizCountFromJson(json);

  Map<String, dynamic> toJson() => _$QuizCountToJson(this);
}
