import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateQuestionStepTwo extends ConsumerStatefulWidget {
  const CreateQuestionStepTwo({
    super.key,
    required this.handleNext,
    required this.handlePrevious,
  });

  final VoidCallback handleNext;
  final VoidCallback handlePrevious;

  @override
  _CreateQuestionStepTwoState createState() => _CreateQuestionStepTwoState();
}

class _CreateQuestionStepTwoState extends ConsumerState<CreateQuestionStepTwo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
