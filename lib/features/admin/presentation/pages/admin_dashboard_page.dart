import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/features/admin/presentation/widgets/Dashboard_Description_section.dart';
import 'package:q_learn/features/admin/presentation/widgets/Dashboard_Options_Card.dart';
import 'package:q_learn/features/admin/presentation/widgets/Dashboard_Category_List.dart';

@RoutePage()
class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Technology',
      'Science',
      'Langage',
      'Mathematics',
      'History',
      'Other',
    ];

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      // Handle back button press
                    },
                  ),
                  toolbarHeight: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0)
                      .copyWith(bottom: 100.0),
                  child: const DashboardDescriptionSection(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -90),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const DashboardOptionsCard(),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Browse by subject',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle view all button press
                          },
                          child: const Text(
                            'View All',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DashboardCategoryList(categories: categories),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
