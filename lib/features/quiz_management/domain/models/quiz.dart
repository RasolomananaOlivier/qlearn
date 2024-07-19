import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/features/question_management/domain/models/question.dart';

part 'quiz.g.dart';

@JsonSerializable()
class Quiz {
  final int id;
  final String name;
  final String description;
  final double difficulty;
  final List<Question> questions;

  Quiz({
    required this.id,
    required this.name,
    required this.description,
    this.questions = const [],
    this.difficulty = 1,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  Map<String, dynamic> toJson() => _$QuizToJson(this);
}
