import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  final int id;
  final int quizId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int score;

  Session({
    required this.id,
    required this.quizId,
    required this.createdAt,
    required this.updatedAt,
    required this.score,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);

  String getPercentage() {
    return "${score / 10 * 100}%";
  }

  String getResultMessage() {
    if (score >= 5) {
      return "Bien joué ! Vous avez repondu correctement à $score/10 questions.";
    } else {
      return "Oops! Vous n'avez repondu correctement qu'à $score/10 questions. La prochaine fois sera peut-être la bonne.";
    }
  }
}
