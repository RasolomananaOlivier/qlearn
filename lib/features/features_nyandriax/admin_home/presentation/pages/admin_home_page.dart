import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/models/quizz.dart';
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

  final List<Quizz> _quizzes = [
    Quizz(
      description: "djhsdjfh",
      name: "sjfh",
      difficulty: 4,
      categoryId: 2,
    ),
    Quizz(
      description: "Introduction to Flutter",
      name: "Flutter Basics",
      difficulty: 3,
      categoryId: 1,
    ),
    Quizz(
      description: "Advanced React Techniques",
      name: "React Pro",
      difficulty: 5,
      categoryId: 3,
    ),
  ];

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
          const ListCategoryPage(),
          ListQuizPage(quizzes: _quizzes),
          const ListQuestionPage(),
        ],
      ),
    );
  }
}
