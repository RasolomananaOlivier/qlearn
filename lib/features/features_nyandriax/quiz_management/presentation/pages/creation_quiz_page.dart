import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/common/domain/models/quiz.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/presentation/widgets/description_and_name.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/presentation/widgets/category_and_difficulty.dart';

@RoutePage()
class CreationQuizPage extends ConsumerStatefulWidget {
  final Quiz? quiz;

  const CreationQuizPage({super.key, this.quiz});

  @override
  ConsumerState<CreationQuizPage> createState() => _CreationQuizPageState();
}

class _CreationQuizPageState extends ConsumerState<CreationQuizPage> {
  final PageController _pageController = PageController();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _difficultyController;
  late final TextEditingController _categoryIdController;

  @override
  void initState() {
    super.initState();
    // _nameController = TextEditingController(text: widget.quiz?.name ?? '');
    // _descriptionController =
    //     TextEditingController(text: widget.quiz?.description ?? '');
    // _difficultyController =
    //     TextEditingController(text: widget.quiz?.difficulty.toString() ?? '');
    // _categoryIdController =
    //     TextEditingController(text: widget.quiz?.categoryId.toString() ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _difficultyController.dispose();
    _categoryIdController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _previousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _saveQuiz() {
    // final newQuiz = Quizz(
    //   description: _descriptionController.text,
    //   name: _nameController.text,
    //   difficulty: int.parse(_difficultyController.text),
    //   categoryId: int.parse(_categoryIdController.text),
    // );

    if (widget.quiz != null) {
      // Modifier un quiz existant
      // TODO: Ajouter la logique de mise à jour du quiz
    } else {
      // Créer un nouveau quiz
      // TODO: Ajouter la logique de création d'un nouveau quiz
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text(widget.quiz != null ? 'Modifier le quiz' : 'Créer un quiz'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: _saveQuiz,
              child: const Text('Sauvegarder',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            DescriptionAndName(
              descriptionController: _descriptionController,
              nameController: _nameController,
              onNext: _nextPage,
            ),
            DifficultyAndCategory(
              difficultyController: _difficultyController,
              categoryIdController: _categoryIdController,
              onPrevious: _previousPage,
              onNext: _nextPage,
            ),
          ],
        ));
  }
}
