import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/config/router/app_router.dart';

class DashboardOptionsCard extends StatelessWidget {
  const DashboardOptionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: _buildCard(
              context,
              'Search',
              additionalText: 'Search questions and quizzes here',
              additionalTextStyle: const TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              Icons.search,
              _showSearchDialog,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: _buildCard(
              context,
              'Create',
              additionalText: 'Create a quizz and question here',
              additionalTextStyle: const TextStyle(
                fontSize: 12,
                color: Colors.blueGrey,
              ),
              Icons.add,
              _showOptionsBottomSheet,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    IconData icon,
    Function(BuildContext) onTap, {
    Color color = Colors.white,
    String? additionalText,
    TextStyle? additionalTextStyle,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: const BorderSide(
          color: Color(0xFFEAEAEA),
          width: 1,
        ),
      ),
      elevation: 0,
      child: InkWell(
        onTap: () => onTap(context),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                    color: const Color(0xFFEAEAEA),
                    width: 1.0,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.blueGrey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 0.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              if (additionalText != null)
                Text(
                  additionalText,
                  style: additionalTextStyle ??
                      const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                  textAlign: TextAlign.start,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Search'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter search term',
            ),
            onChanged: (value) {
              // Handle search input change
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('Question'),
              onTap: () {
                AutoRouter.of(context).push(const CreationQuestionRoute());
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.quiz),
              title: const Text('Quiz'),
              onTap: () {
                AutoRouter.of(context).push(const CreationQuizzRoute());
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
