import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
      if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
    }

    void onTapAppBar() {
      Go.back(context);
    }

    Widget eventImage() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        child: Image.asset(
          _article.imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Html(
          data: _article.article,
          style: {
            'div': Style(
              padding: HtmlPaddings.zero,
              margin: Margins.zero,
            ),
            'p': Style(
              padding: HtmlPaddings.zero,
              margin: Margins.zero,
              textAlign: TextAlign.justify,
              lineHeight: const LineHeight(
                1.8,
              ),
            ),
            'ol': Style(
              padding: HtmlPaddings.only(
                top: 8,
                bottom: 8,
                left: 16,
              ),
            ),
          },
        ),
      );
    }

    Widget readMore() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Read more:'),
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
            Container(
              margin: EdgeInsets.all(defaultMargin),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
              child: Column(
                children: [
                  eventImage(),
                  description(),
                  readMore(),
                ],
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
