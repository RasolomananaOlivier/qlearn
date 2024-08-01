import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/features_nyandriax/question_management/domain/models/question.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/widgets/content_and_answers.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/widgets/correct_answers.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/widgets/difficulty_and_category.dart';

@RoutePage()
class CreationQuestionPage extends ConsumerStatefulWidget {
  final Question? question;

  const CreationQuestionPage({super.key, this.question});

  @override
  ConsumerState<CreationQuestionPage> createState() =>
      _CreationQuestionPageState();
}

class _CreationQuestionPageState extends ConsumerState<CreationQuestionPage> {
  final PageController _pageController = PageController();
  late TextEditingController _contentController;
  late TextEditingController _difficultyController;
  late TextEditingController _categoryIdController;
  final List<TextEditingController> _answerControllers = [];
  final List<bool> _answerCorrectness = [];

  @override
  void initState() {
    super.initState();

    _contentController =
        TextEditingController(text: widget.question?.content ?? '');
    _difficultyController = TextEditingController(
        text: widget.question?.difficulty.toString() ?? '1');
    _categoryIdController = TextEditingController(
        text: widget.question?.categoryId.toString() ?? '1');

    if (widget.question != null) {
      _answerCorrectness.addAll(
          widget.question!.answers.map((answer) => answer.isCorrect).toList());
      _answerControllers.addAll(widget.question!.answers
          .map((answer) => TextEditingController(text: answer.content))
          .toList());
    } else {
      _answerCorrectness.addAll(List.generate(4, (_) => false));
      _answerControllers
          .addAll(List.generate(4, (_) => TextEditingController()));
    }
  }

  @override
  void dispose() {
    _contentController.dispose();
    _difficultyController.dispose();
    _categoryIdController.dispose();
    for (var controller in _answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Map<String, dynamic> _filterData() {
    int difficulty = (_difficultyController.text.isNotEmpty &&
            int.tryParse(_difficultyController.text) != null)
        ? int.parse(_difficultyController.text)
        : 1;
    int categoryId = (_categoryIdController.text.isNotEmpty &&
            int.tryParse(_categoryIdController.text) != null)
        ? int.parse(_categoryIdController.text)
        : 1;
    List<Map<String, dynamic>> filteredAnswers = _answerControllers
        .asMap()
        .entries
        .where((entry) => entry.value.text.isNotEmpty)
        .map((entry) => {
              "content": entry.value.text,
              "isCorrect": _answerCorrectness[entry.key],
            })
        .toList();
    return {
      "content": _contentController.text,
      "difficulty": difficulty,
      "categoryId": categoryId,
      "answers": filteredAnswers,
    };
  }

  void _printCurrentData() {
    Map<String, dynamic> filteredData = _filterData();
    String jsonData = jsonEncode(filteredData);
    print(jsonData);
  }

  void _nextPage() {
    _printCurrentData();
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _previousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _saveQuestion() {
    final data = _filterData();
    if (widget.question != null) {
      // Logique pour mettre à jour la question existante
      print("Mise à jour de la question : $data");
    } else {
      // Logique pour créer une nouvelle question
      print("Création de la question : $data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.question != null
            ? 'Modifier la question'
            : 'Créer une question'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ContentAndAnswers(
            contentController: _contentController,
            answerControllers: _answerControllers,
            onNext: _nextPage,
          ),
          DifficultyAndCategory(
            difficultyController: _difficultyController,
            categoryIdController: _categoryIdController,
            onNext: _nextPage,
            onPrevious: _previousPage,
          ),
          CorrectAnswers(
            answerControllers: _answerControllers,
            answerCorrectness: _answerCorrectness,
            onPrevious: _previousPage,
            onSave: _saveQuestion,
          ),
        ],
      ),
    );
  }
}
