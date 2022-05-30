import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:ta_bsi/src/data/models/article_model.dart';

class ArticleService {
  static Future<List<ArticleModel>> getArticleJson() async {
    final String response =
        await rootBundle.loadString('assets/json/list_article.json');

    List data = await json.decode(response);

    final List<ArticleModel> listArticle =
        data.map((article) => ArticleModel.fromSnapshot(article)).toList();

    return listArticle;
  }

  static Future<List<ArticleModel>> fetchArticle() async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('/article').get();

    List list = snapshot.value as List;

    final List<ArticleModel> listArticle =
        list.map((e) => ArticleModel.fromSnapshot(e)).toList();

    return listArticle;
  }
}
