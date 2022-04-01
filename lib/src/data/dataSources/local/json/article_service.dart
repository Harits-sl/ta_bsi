import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ta_bsi/src/data/models/article_model.dart';

class ArticleService {
  static Future<List<ArticleModel>> getArticleJson() async {
    final String response =
        await rootBundle.loadString('assets/json/list_article.json');

    List data = await json.decode(response);

    final List<ArticleModel> listArticle =
        data.map((article) => ArticleModel.fromJson(article)).toList();

    return listArticle;
  }
}
