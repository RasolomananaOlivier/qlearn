import 'package:json_annotation/json_annotation.dart';
import 'package:q_learn/core/common/domain/models/session.dart';

part 'submit_quizz_response.g.dart';

@JsonSerializable()
class SubmitQuizzResponse {
  final Session session;

  SubmitQuizzResponse({
    required this.session,
  });

  factory SubmitQuizzResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitQuizzResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitQuizzResponseToJson(this);
}
