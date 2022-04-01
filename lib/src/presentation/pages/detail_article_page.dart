import 'package:flutter/material.dart';
import 'package:ta_bsi/src/presentation/widgets/header_back_and_title.dart';
import 'package:ta_bsi/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailArticlePage extends StatelessWidget {
  const DetailArticlePage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listDummyDetailArticle = [
      {
        'id': 'article-1',
        'title': '40 Tips that will change your coding skills forever',
        'image_url': 'assets/images/article_1.jpg',
        'article':
            'In this summary, I list some of the things that have helped me in my career. It reads fast, but applying them well can take a lifetime. I have been developing applications for almost 15 years, and still, sometimes, I have to stop and think in the essential parts of this profession.\nTake the code and break down big pieces of code into small functions.\nIf by the time you leave work you haven`t solved the problem. Turn off the computer and leave it for the next day. Don`t think about the problem anymore.\nYAGNI principle: “You aren`t gonna need it” or don`t codify more than you`ve been asked to. Don`t anticipate the future, and just create something that works as soon as possible. Code only the necessary parts to solve the current problem.\nYou don`t need to know everything, nor all the existing frameworks. The most significant thing is to have a good base. Know the language in depth before starting with a Framework and learn fundamental things like the SOLID principles or how to write clean code.\nKISS: “Keep it simple, stupid” or “keep it stupid simple” is a design principle that states that most systems work best if they are kept simple rather than made complicated. And while this is logical, it is sometimes difficult to achieve.\nDon`t overthink it.\nIf you`re with a problem or a bug too long, walk away, and come back to it later. Often, the best solutions to the problems occur to me on the way from my office to the bathroom. Taking a walk away is also advisable when you are angry with a client or with a coworker, especially if you want to keep your job.',
        'link':
            'https://medium.com/swlh/40-tips-that-will-change-your-coding-skills-forever-bf9d6b936ccc',
      },
    ];

    /// filter atau mencari materi yang cocok dari argument id dengan
    /// listDummyCourse
    Map<String, dynamic> _article = listDummyDetailArticle
        .where((item) => item['id'] == arguments['id'])
        .toList()
        .first;

    void onPressed(String url) async {
      if (!await launch(url)) throw 'Could not launch $url';
    }

    Widget eventImage() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Image.asset(_article['image_url']),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(_article['article']),
      );
    }

    Widget seeMore() {
      return Container(
        margin: EdgeInsets.only(
          top: 12,
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('See more:'),
            TextButton(
              onPressed: () => onPressed(_article['link']),
              child: Text(_article['link']),
            ),
          ],
        ),
      );
    }

    Widget body() {
      return SafeArea(
        child: ListView(
          children: [
            const HeaderBackAndTitle(title: 'Article'),
            eventImage(),
            description(),
            seeMore(),
          ],
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
