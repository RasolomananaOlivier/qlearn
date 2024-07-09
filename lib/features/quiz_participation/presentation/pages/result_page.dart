import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/config/router/app_router.dart';

@RoutePage()
class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  void handleClick() {
    context.router.replaceAll([const ClientHomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(child: buildBody()),
    );
  }

  Widget buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Correct answers
          const Text(
            "Votre Score",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            "75%",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent.shade400,
            ),
          ),

          const SizedBox(height: 20),

          // Incorrect answers
          const SizedBox(
            width: 210,
            child: Text(
              "Bien joué ! Vous avez repondu correctement à 15/20 questions.",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
