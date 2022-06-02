import 'package:flutter/material.dart';
import 'package:ta_bsi/src/data/models/article_model.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_app_bar.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailArticlePage extends StatelessWidget {
  const DetailArticlePage(this.article, {Key? key}) : super(key: key);

  final Object? article;

  @override
  Widget build(BuildContext context) {
    final ArticleModel _article = article as ArticleModel;

    void onPressed(String url) async {
      if (!await launch(url)) throw 'Could not launch $url';
    }

    void onTapAppBar() {
      Go.back(context);
    }

    Widget eventImage() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Image.asset(_article.imageUrl),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(_article.article),
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
            const Text('See more:'),
            TextButton(
              onPressed: () => onPressed(_article.link),
              child: Text(_article.link),
            ),
          ],
        ),
      );
    }

    Widget body() {
      return SafeArea(
        child: ListView(
          children: [
            CustomAppBar(title: 'Article', onTap: onTapAppBar),
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
