import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  void handleClick() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Votre résultat"),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      // Validate and next button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
          onPressed: handleClick,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent.shade400,
            minimumSize: const Size.fromHeight(44),
          ),
          child: const Text(
            "Retour à l'acceuil",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Correct answers
          Text("Réponses correctes"),
          Text(
            "2/3",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 20),

          // Incorrect answers
          Text("Réponses erronées"),
          Text(
            "1/3",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
