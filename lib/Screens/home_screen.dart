import 'package:flutter/material.dart';
import 'dart:math';
import 'package:quiz_app/Screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> availableQuizzes = ['Math Quiz', 'Science Quiz', 'History Quiz'];
  final random = Random();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: ListView(
        children: availableQuizzes.map((quizName) {
          return ListTile(
            title: Text(quizName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizScreen(quizName: quizName),
                ),
              );
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final randomQuizName = 'Random Quiz ${random.nextInt(100)}';
          availableQuizzes.add(randomQuizName);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizScreen(quizName: randomQuizName),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}