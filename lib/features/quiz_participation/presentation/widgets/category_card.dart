import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/config/router/app_router.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  void handleTap(BuildContext context) {
    context.router.push(const QuizListRoute());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleTap(context),
      child: Card(
        color: Colors.blueGrey.shade50,
        elevation: 0,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category name and forward arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "JavaScript",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
              SizedBox(height: 10),

              // Quizzes count
              Text("1k+ quizs")
            ],
          ),
        ),
      ),
    );
  }
}
