import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/quiz.dart';

part 'quizzes_response.g.dart';

@JsonSerializable()
class QuizzesResponse {
  final List<Quiz> quizzes;

  QuizzesResponse({required this.quizzes});

  factory QuizzesResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizzesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuizzesResponseToJson(this);
}
