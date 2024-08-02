class Question {
  final int id;
  final String content;
  final List<Answer> answers;

  Question({
    required this.id,
    required this.content,
    required this.answers,
  });
}

class Answer {
  final String content;
  final bool isCorrect;

  Answer({
    required this.content,
    required this.isCorrect,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      content: json['content'],
      isCorrect: json['isCorrect'],
    );
  }
}
