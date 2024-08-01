import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/models/quiz.dart';
import 'package:q_learn/features/features_nyandriax/question_management/domain/models/question.dart';
import 'package:q_learn/features/features_nyandriax/admin_dashboard/presentation/pages/admin_dashboard_page.dart';
import 'package:q_learn/features/features_nyandriax/category_management/presentation/pages/list_category_page.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/pages/list_question_page.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/presentation/pages/list_quiz_page.dart';

@RoutePage()
class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {
      'id': 1,
      'name': 'Catégorie 1',
      'description': 'Description de Catégorie 1'
    },
    {
      'id': 2,
      'name': 'Catégorie 2',
      'description': 'Description de Catégorie 2'
    },
    {
      'id': 3,
      'name': 'Catégorie 3',
      'description': 'Description de Catégorie 3'
    },
  ];

  final List<Map<String, dynamic>> _questionsJsonData = [
    {
      'id': 1,
      'content': 'Quel est le résultat de 2 + 2 ?',
      'difficulty': 3,
      'categoryId': 1,
      'answers': [
        {'content': '3', 'isCorrect': false},
        {'content': '4', 'isCorrect': true},
      ]
    },
    {
      'id': 2,
      'content': 'Quelle est la capitale de la France ?',
      'difficulty': 2,
      'categoryId': 2,
      'answers': [
        {'content': 'Berlin', 'isCorrect': false},
        {'content': 'Madrid', 'isCorrect': false},
        {'content': 'Rome', 'isCorrect': false}
      ]
    },
    {
      'id': 3,
      'content': 'Quelle est la couleur du ciel par temps clair ?',
      'difficulty': 1,
      'categoryId': 3,
      'answers': [
        {'content': 'Rouge', 'isCorrect': false},
        {'content': 'Bleu', 'isCorrect': true},
        {'content': 'Jaune', 'isCorrect': false}
      ]
    },
  ];

  final List<Quiz> _quizzes = [
    Quiz(
      description: "djhsdjfh",
      name: "sjfh",
      difficulty: 4,
      categoryId: 2,
    ),
    Quiz(
      description: "Introduction to Flutter",
      name: "Flutter Basics",
      difficulty: 3,
      categoryId: 1,
    ),
    Quiz(
      description: "Advanced React Techniques",
      name: "React Pro",
      difficulty: 5,
      categoryId: 3,
    ),
  ];

  List<Question> questions = [];

  @override
  void initState() {
    super.initState();
    questions =
        _questionsJsonData.map((json) => Question.fromJson(json)).toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Catégorie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Question',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          AdminDashboardPage(onItemTapped: _onItemTapped),
          ListCategoryPage(categories: _categories),
          ListQuizPage(quizzes: _quizzes),
          ListQuestionPage(questions: questions),
        ],
      ),
    );
  }
}