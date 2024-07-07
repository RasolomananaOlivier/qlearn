import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';

part 'quizzes_request.g.dart';

@JsonSerializable()
class QuizzesRequest {
  final int? categoryId;

  QuizzesRequest({this.categoryId});

  factory QuizzesRequest.fromJson(Map<String, dynamic> json) =>
      _$QuizzesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QuizzesRequestToJson(this);
}
