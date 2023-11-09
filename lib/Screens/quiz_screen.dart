import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String quizName;

  const QuizScreen({Key? key, required this.quizName}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;
  late List<Question> _questions;

  @override
  void initState() {
    _questions = generateQuestions();
    super.initState();
  }

  List<Question> generateQuestions() {

    switch (widget.quizName) {
      case 'Math Quiz':
        return [
          Question('What is 2 + 2?', ['3', '4', '5', '6'], 1),
          Question('Solve for x: 3x - 5 = 10', ['-1', '3', '5', '7'], 2),
        ];
      case 'Science Quiz':
        return [
          Question('Which gas do plants absorb from the atmosphere?', ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'], 1),
          Question('What is the chemical symbol for water?', ['H2O', 'CO2', 'O2', 'NaCl'], 0),
        ];
      case 'History Quiz':
        return [
          Question('In which year did World War I begin?', ['1914', '1916', '1918', '1920'], 0),
          Question('Who was the first President of the United States?', ['George Washington', 'Thomas Jefferson', 'John Adams', 'James Madison'], 0),
        ];
      default:
        return [
          Question('What is the capital of a random country?', ['City A', 'City B', 'City C', 'City D'], 0),
          Question('Random question about a random topic?', ['Option A', 'Option B', 'Option C', 'Option D'], 1),
        ];
    }
  }

  void _answerQuestion(int selectedOption) {
    if (_questions[_questionIndex].isCorrect(selectedOption)) {
      setState(() {
        _score++;
      });
    }

    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: _score,
            totalQuestions: _questions.length,
            correctAnswers: _questions.where((q) => q.isCorrect(q.selectedOption)).toList(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quizName),
      ),
      body: _questionIndex < _questions.length
          ? QuizQuestion(
        question: _questions[_questionIndex],
        onAnswered: _answerQuestion,
      )
          : const Center(
        child: Text('You completed the quiz!'),
      ),
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final Question question;
  final void Function(int) onAnswered;

  const QuizQuestion({Key? key, required this.question,
    required this.onAnswered}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          question.text,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        ...question.options.asMap().entries.map((entry) {
          final index = entry.key;
          final option = entry.value;
          return AnswerButton(
            text: option,
            onPressed: () => onAnswered(index),
          );
        }).toList(),
      ],
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AnswerButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctAnswer;
  int selectedOption = -1;

  Question(this.text, this.options, this.correctAnswer);

  bool isCorrect(int selectedOption) {
    this.selectedOption = selectedOption;
    return selectedOption == correctAnswer;
  }
}
