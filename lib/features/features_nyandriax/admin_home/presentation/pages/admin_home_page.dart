import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/common/domain/models/question.dart';
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
      'answers': [
        {'id': 1, 'content': '3', 'isCorrect': false},
        {'id': 1, 'content': '4', 'isCorrect': true},
      ]
    },
    {
      'id': 2,
      'content': 'Quelle est la capitale de la France ?',
      'answers': [
        {'id': 1, 'content': 'Berlin', 'isCorrect': false},
        {'id': 1, 'content': 'Madrid', 'isCorrect': false},
        {'id': 1, 'content': 'Rome', 'isCorrect': false}
      ]
    },
    {
      'id': 3,
      'content': 'Quelle est la couleur du ciel par temps clair ?',
      'answers': [
        {'id': 1, 'content': 'Rouge', 'isCorrect': false},
        {'id': 1, 'content': 'Bleu', 'isCorrect': true},
        {'id': 1, 'content': 'Jaune', 'isCorrect': false}
      ]
    },
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
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
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
          const ListCategoryPage(),
          const ListQuizPage(),
          const ListQuestionPage(),
        ],
      ),
    );
  }
}
