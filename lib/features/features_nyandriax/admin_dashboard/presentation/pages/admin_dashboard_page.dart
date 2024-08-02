import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminDashboardPage extends ConsumerStatefulWidget {
  final void Function(int) onItemTapped;

  const AdminDashboardPage({super.key, required this.onItemTapped});

  @override
  ConsumerState<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends ConsumerState<AdminDashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Tableau de bord'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: _BuildBody(onItemTapped: widget.onItemTapped),
      ),
    );
  }
}

class _BuildBody extends StatelessWidget {
  final void Function(int) onItemTapped;

  const _BuildBody({
    super.key,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(color: Colors.blueAccent, width: 2.0),
            ),
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 16.0),
            child: const ListTile(
              contentPadding: EdgeInsets.all(20.0),
              title: Text(
                'Total Questions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                '45',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(color: Colors.greenAccent, width: 2.0),
            ),
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 16.0),
            child: const ListTile(
              contentPadding: EdgeInsets.all(20.0),
              title: Text(
                'Total Quiz',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                '12',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(color: Colors.redAccent, width: 2.0),
            ),
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 16.0),
            child: const ListTile(
              contentPadding: EdgeInsets.all(20.0),
              title: Text(
                'Total Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                '0',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            'Gestion de contenu',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          _buildContentSection('Categorie', 1),
          _buildContentSection('Question', 3),
          _buildContentSection('Quiz', 2),
        ],
      ),
    );
  }

  Widget _buildContentSection(String title, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 12.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
