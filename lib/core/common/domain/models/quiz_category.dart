import 'package:json_annotation/json_annotation.dart';

part 'quiz_category.g.dart';

@JsonSerializable()
class QuizCategory {
  final int id;
  final String name;
  @JsonKey(name: '_count')
  final CategoryCount? count;

  QuizCategory({
    required this.id,
    required this.name,
    this.count,
  });

  factory QuizCategory.fromJson(Map<String, dynamic> json) =>
      _$QuizCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$QuizCategoryToJson(this);
}

@JsonSerializable()
class CategoryCount {
  final int quizzes;

  CategoryCount({required this.quizzes});

  factory CategoryCount.fromJson(Map<String, dynamic> json) =>
      _$CategoryCountFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryCountToJson(this);
}
