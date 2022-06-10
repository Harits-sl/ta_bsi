import 'package:flutter/material.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_app_bar.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_button.dart';
import 'package:ta_bsi/src/presentation/widgets/item_button_answer.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class QuizPage extends StatefulWidget {
  const QuizPage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

enum Answer {
  /// nilai default
  notAnswered,

  /// nilai ketika jawaban benar
  correct,

  /// nilai ketika jawaban salah
  inCorrect,
}

class _QuizPageState extends State<QuizPage> {
  /// variabel type data dari enum Answer
  late Answer _answer;

  /// variabel boolean apakah pertanyaan
  /// sudah dijawab atau belom
  late bool _isAnswered;

  /// variabel boolean apakah kuis
  /// sudah selesai atau belom
  late bool _isQuizDone;

  /// variabel banyaknya jawaban yang dijawab benar
  late int _manyCorrectAnswer;

  // style untuk buttonContinue
  /// textStyle untuk teks button continue
  late TextStyle? textStyleButtonContinue;

  /// warna background container
  late Color? backgroundContainerButtonContinue;

  /// warna background button
  late Color? backgroundButtonContinue;

  /// icon yang akan ditampilkan diatas button continue
  late Icon _icon;

  /// text yang akan ditampilkan disebelah [_icon]
  late Text _text;

  /// variabel untuk list index question
  late int _indexForQuestion;

  @override
  void initState() {
    super.initState();

    _answer = Answer.notAnswered;
    _isAnswered = false;
    _isQuizDone = false;
    _indexForQuestion = 0;
    _manyCorrectAnswer = 0;

    textStyleButtonContinue = darkGreyTextStyle;
    backgroundContainerButtonContinue = whiteColor;
    backgroundButtonContinue = backgroundColor;

    _icon = Icon(
      Icons.question_mark_rounded,
      size: 20,
      color: greyColor,
    );

    _text = Text(
      'Pilih jawaban',
      style: darkGreyTextStyle.copyWith(
        fontSize: 12,
      ),
    );
  }

  void changeState() {
    switch (_answer) {
      case Answer.notAnswered:
        setState(() {
          textStyleButtonContinue = darkGreyTextStyle;
          backgroundContainerButtonContinue = whiteColor;
          backgroundButtonContinue = backgroundColor;

          _icon = Icon(
            Icons.question_mark_rounded,
            size: 20,
            color: greyColor,
          );
          _text = Text(
            'Pilih jawaban',
            style: darkGreyTextStyle.copyWith(
              fontSize: 12,
            ),
          );
        });
        break;
      case Answer.correct:
        setState(() {
          _manyCorrectAnswer++;
          textStyleButtonContinue = whiteTextStyle;
          backgroundContainerButtonContinue = lightGreenColor;
          backgroundButtonContinue = greenColor;

          _icon = Icon(
            Icons.thumb_up_alt,
            size: 20,
            color: greenColor,
          );
          _text = Text(
            'Kamu benarr',
            style: greenTextStyle.copyWith(
              fontSize: 12,
            ),
          );
        });
        break;
      case Answer.inCorrect:
        setState(() {
          textStyleButtonContinue = whiteTextStyle;
          backgroundContainerButtonContinue = lightRedColor;
          backgroundButtonContinue = redColor;

          _icon = Icon(
            Icons.thumb_down_alt,
            size: 20,
            color: redColor,
          );
          _text = Text(
            'Upss salah',
            style: redTextStyle.copyWith(
              fontSize: 12,
            ),
          );
        });
        break;
      default:
        print('_answer null');
    }
  }

  void onTapButtonAnswer({
    required String correctAnswer,
    required String tapKeyAnswer,
  }) {
    // ubah value _isAnswered menjadi true
    _isAnswered = true;

    /// jika [_isAnswered] true dan [_answer] valuenya bukan
    /// [Answer.notAnswered] maka return kosong
    /// perintah ini membuat button tidak bisa digunakan / disabled
    // if (_isAnswered && _answer != Answer.notAnswered) return;

    /// jika [tapKeyAnswer] sama dengan [correctAnswer] maka
    /// variabel [_answer] menjadi Answer.correct
    /// jika salah variabel [_answer] menjadi Answer.inCorrect
    /// dan panggil fungsi [changeState()]
    if (correctAnswer == tapKeyAnswer) {
      _answer = Answer.correct;
    } else {
      _answer = Answer.inCorrect;
    }
    // _indexForQuestion++;
    changeState();
  }

  void onTapButtonContinue() {
    /// jika [_indexForQuestion] sama dengan banyaknya pertanyaan
    if (_indexForQuestion == 4) {
      setState(() {
        _isQuizDone = true;
      });
      return;
    }

    /// [_isAnswered] false / belom dijawab maka return kosong
    /// perintah ini membuat button tidak bisa digunakan / disabled
    if (!_isAnswered) return;

    /// increment [_indexForQuestion], ubah value [_isAnswered] menjadi false
    ///  ubah value [_answer] menjadi Answer.notAnswered
    /// dan panggil fungsi [changeState] fungsi ini untuk
    /// mengubah pertanyaan danmembalikan warna button continue
    setState(() {
      _indexForQuestion++;
      _isAnswered = false;
      _answer = Answer.notAnswered;
    });
    changeState();
  }

  void onTapRouteToHome() {
    Go.routeWithPathAndRemove(context: context, path: '/main');
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listDummyQuiz = [
      {
        'question': 'Apa itu flutter?',
        'image_url': 'assets/images/dart_comments.png',
        'answer': [
          {
            '1': 'flutter adalah framework',
            '2': 'flutter adalah bahasa',
            '3': 'flutter adalah program',
            '4': 'semua salah',
          },
        ],
        'correct_answer': '1',
        'explanation':
            'karena flutter adalah framework adsadsadjfnsefdasdsfsaf fdewqffef dasfsaffef qf32rf4g 3452345 dfewf r23r3r fwefewf',
      },
      {
        'question': 'Apa itu asd?',
        'image_url': 'assets/images/dart_comments.png',
        'answer': [
          {
            '1': 'Dart adalah framework',
            '2': 'Dart adalah bahasa',
            '3': 'Dart adalah program',
            '4': 'semua salah',
          },
        ],
        'correct_answer': '2',
        'explanation': 'karena dart adalah framework adsadsadjfnsef',
      },
      {
        'question': 'Apa itu dasd?',
        'image_url': 'assets/images/dart_comments.png',
        'answer': [
          {
            '1': 'Dart adalah framework',
            '2': 'Dart adalah bahasa',
            '3': 'Dart adalah program',
            '4': 'semua salah',
          },
        ],
        'correct_answer': '2',
        'explanation': 'karena dart adalah framework adsadsadjfnsef',
      },
      {
        'question': 'Apa itu dsadsd?',
        'image_url': 'assets/images/dart_comments.png',
        'answer': [
          {
            '1': 'Dart adalah framework',
            '2': 'Dart adalah bahasa',
            '3': 'Dart adalah program',
            '4': 'semua salah',
          },
        ],
        'correct_answer': '2',
        'explanation': 'karena dart adalah framework adsadsadjfnsef',
      },
      {
        'question': 'Apa itu wd?',
        'image_url': 'assets/images/dart_comments.png',
        'answer': [
          {
            '1': 'Dart adalah framework',
            '2': 'Dart adalah bahasa',
            '3': 'Dart adalah program',
            '4': 'semua salah',
          },
        ],
        'correct_answer': '2',
        'explanation': 'karena dart adalah framework adsadsadjfnsef',
      },
    ];

    Widget appBar() {
      return CustomAppBar(onTap: () {});
    }

    Widget titleQuestion(String title) {
      return Padding(
        padding: EdgeInsets.only(bottom: defaultMargin),
        child: Center(
          child: Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget imageQuestion(String imageUrl) {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Image.asset(imageUrl),
      );
    }

    Widget listButtonAnswer() {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // variable dari key answer
          String keyAnswer = listDummyQuiz[_indexForQuestion]['answer'][0]
              .keys
              .elementAt(index);
          return GestureDetector(
            onTap: () {
              onTapButtonAnswer(
                correctAnswer: listDummyQuiz[_indexForQuestion]
                    ['correct_answer'],
                tapKeyAnswer: keyAnswer,
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                bottom: index == 3
                    ? 45 + 20 + 16 + 12 // tinggi buttonContinue
                    : 0,
              ),
              child: ItemButtonAnswer(
                answer: listDummyQuiz[_indexForQuestion]['answer'][0]
                    ['${index + 1}'],
                keyAnswer: keyAnswer,
              ),
            ),
          );
        },
      );
    }

    Widget explanationAnswer() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: 45 + 20 + 16 + 12, // tinggi buttonContinue
        ),
        child: Text(
          listDummyQuiz[_indexForQuestion]['explanation'],
          style: blackTextStyle.copyWith(
            fontWeight: regular,
            height: 1.8,
          ),
        ),
      );
    }

    Widget finishQuiz() {
      return Center(
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: 250,
          ),
          margin: EdgeInsets.all(defaultMargin),
          padding: EdgeInsets.all(defaultMargin),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: darkGreyColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Kamu menjawab benar sebanyak $_manyCorrectAnswer soal',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              CustomButton(
                title: 'Kembali ke halaman utama',
                onPressed: onTapRouteToHome,
              ),
            ],
          ),
        ),
      );
    }

    Widget buttonContinue() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: lightGreyColor),
            color: backgroundContainerButtonContinue,
          ),
          child: Container(
            constraints: const BoxConstraints(
              // height button + height icon + padding icon + padding button
              maxHeight: 45 + 20 + 16 + 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                    bottom: 6,
                  ),
                  child: Row(
                    children: [
                      _icon,
                      const SizedBox(width: 8),
                      _text,
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: CustomButton(
                    title: _indexForQuestion == 4 ? 'Finish Quiz' : 'Continue',
                    onPressed: onTapButtonContinue,
                    backgroundColor: backgroundButtonContinue,
                    borderRadius: 12,
                    textStyle: textStyleButtonContinue!.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      return SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                appBar(),
                titleQuestion(listDummyQuiz[_indexForQuestion]['question']),
                imageQuestion(listDummyQuiz[_indexForQuestion]['image_url']),

                /// jika [_answer] nilainya Answer.notAnswered
                /// tampilkan listButtonAnswer
                /// jika [_answer] nilainya Answer.correct / inCorrect
                /// tampilkan descriptionAnswer
                _answer == Answer.notAnswered
                    ? listButtonAnswer()
                    : explanationAnswer(),
              ],
            ),
            buttonContinue(),
            _isQuizDone ? finishQuiz() : Container(),
          ],
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
