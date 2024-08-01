import 'package:json_annotation/json_annotation.dart';

part 'submit_quizz_request.g.dart';

@JsonSerializable()
class SubmitQuizzRequest {
  final int quizId;
  final List<Map<String, int>> sessionAnswers;

  SubmitQuizzRequest({
    required this.quizId,
    required this.sessionAnswers,
  });

  factory SubmitQuizzRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitQuizzRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitQuizzRequestToJson(this);
}
