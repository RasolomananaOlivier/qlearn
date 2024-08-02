import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/quiz.dart';

part 'get_quizzes_response.g.dart';

@JsonSerializable()
class GetQuizzesResponse {
  final List<Quiz> quizzes;

  GetQuizzesResponse({required this.quizzes});

  factory GetQuizzesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetQuizzesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetQuizzesResponseToJson(this);
}
