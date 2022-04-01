import 'package:flutter/material.dart';

import 'package:ta_bsi/src/data/models/article_model.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class CardArticle extends StatelessWidget {
  const CardArticle({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    void onTap(String id) {
      Go.routeWithPath(
        context: context,
        path: '/detail-article',
        arguments: {
          'id': id,
        },
      );
    }

    return GestureDetector(
      onTap: () => onTap(article.id),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: grayColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset(
                article.imageUrl,
                width: 100,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Published by ',
                      style: darkGrayTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: light,
                      ),
                      children: [
                        TextSpan(
                          text: article.publisher,
                          style: blackTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: 160,
                    child: Text(
                      article.title,
                      style: blackTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
