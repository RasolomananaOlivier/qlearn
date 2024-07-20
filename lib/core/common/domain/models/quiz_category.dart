import 'package:json_annotation/json_annotation.dart';

part 'quiz_category.g.dart';

@JsonSerializable()
class QuizCategory {
  final int id;
  final String name;

  QuizCategory({required this.id, required this.name});

  factory QuizCategory.fromJson(Map<String, dynamic> json) =>
      _$QuizCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$QuizCategoryToJson(this);
}
