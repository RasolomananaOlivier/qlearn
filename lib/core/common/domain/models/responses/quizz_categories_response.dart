import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/quiz_category.dart';

part 'quizz_categories_response.g.dart';

@JsonSerializable()
class QuizzCategoriesResponse {
  final List<QuizCategory> categories;

  QuizzCategoriesResponse({required this.categories});

  factory QuizzCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizzCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuizzCategoriesResponseToJson(this);
}
