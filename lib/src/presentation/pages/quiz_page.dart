import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listDummyQuiz = [
      {
        'question': 'Apa itu flutter?',
        'answer': [
          {
            '1': 'flutter adalah framework',
            '2': 'flutter adalah bahasa',
            '3': 'flutter adalah program',
            '4': 'semua salah',
          },
        ],
        'correct_answer': '1',
      },
    ];

    Widget body() {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('quiz'),
          ],
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
