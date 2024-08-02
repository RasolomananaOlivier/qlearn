import 'package:json_annotation/json_annotation.dart';

part 'quiz.g.dart';

@JsonSerializable()
class Quiz {
  final String description;
  final String name;
  final int difficulty;
  final int categoryId;

  Quiz({
    required this.description,
    required this.name,
    required this.difficulty,
    required this.categoryId,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  Map<String, dynamic> toJson() => _$QuizToJson(this);

  @override
  String toString() {
    return 'Quiz{description: $description, name: $name, difficulty: $difficulty, categoryId: $categoryId}';
  }
}
