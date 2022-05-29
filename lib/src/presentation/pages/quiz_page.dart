import 'package:flutter/material.dart';
import 'package:ta_bsi/theme.dart';

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
    String correctAnswer = listDummyQuiz[0]['correct_answer'];

    Widget question() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: defaultMargin),
        child: Center(
          child: Text(
            listDummyQuiz[0]['question'],
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget buttonAnswer(String answer, String key) {
      return GestureDetector(
        onTap: () {
          if (correctAnswer == key)
            print('benar');
          else
            print('salah');
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(key),
              ),
              Text(answer),
            ],
          ),
        ),
      );
    }

    Widget body() {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            question(),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // variable dari key answer
                  String key =
                      listDummyQuiz[0]['answer'][0].keys.elementAt(index);
                  return buttonAnswer(
                      listDummyQuiz[0]['answer'][0]['${index + 1}'], key);
                },
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
