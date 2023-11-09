import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/home_screen.dart';
import 'package:quiz_app/Screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Question> correctAnswers;

  const ResultScreen({Key? key, required this.score,
    required this.totalQuestions, required this.correctAnswers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Score: $score / $totalQuestions',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (
                    context) => HomeScreen()));
              },
              child: const Text('Back to Home'),
            ),
            const SizedBox(height: 25),
            const Text(
              'Correct Answers:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: correctAnswers.map((question) {
                return Text(
                  'Q: ${question.text}\nA: ${question.options[question.correctAnswer]}',
                  style: const TextStyle(fontSize: 18),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
