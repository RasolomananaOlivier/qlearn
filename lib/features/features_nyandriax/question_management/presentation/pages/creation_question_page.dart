import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/common/domain/models/question.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/widgets/create_question_step_one.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/widgets/create_question_step_two.dart';

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

  void handleNext() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void handlePrevious() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
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
          CreateQuestionStepOne(
            handleNext: handleNext,
          ),
          CreateQuestionStepTwo(
            handleNext: handleNext,
            handlePrevious: handlePrevious,
          ),
          // ContentAndAnswers(
          //   contentController: _contentController,
          //   answerControllers: _answerControllers,
          //   onNext: _nextPage,
          // ),
          // DifficultyAndCategory(
          //   difficultyController: _difficultyController,
          //   categoryIdController: _categoryIdController,
          //   onNext: _nextPage,
          //   onPrevious: _previousPage,
          // ),
          // CorrectAnswers(
          //   answerControllers: _answerControllers,
          //   answerCorrectness: _answerCorrectness,
          //   onPrevious: _previousPage,
          //   onSave: _saveQuestion,
          // ),
        ],
      ),
    );
  }
}
