class Question {
  final int id;
  final String content;
  final int difficulty;
  final int categoryId;
  final List<Answer> answers;

  Question({
    required this.id,
    required this.content,
    required this.difficulty,
    required this.categoryId,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      content: json['content'],
      difficulty: json['difficulty'],
      categoryId: json['categoryId'],
      answers: (json['answers'] as List)
          .map((answerJson) => Answer.fromJson(answerJson))
          .toList(),
    );
  }
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
