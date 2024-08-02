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
        ],
      ),
    );
  }
}
