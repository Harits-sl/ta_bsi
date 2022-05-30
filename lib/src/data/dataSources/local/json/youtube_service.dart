import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:ta_bsi/src/data/models/youtube_model.dart';

class YoutubeService {
  static Future<List<YoutubeModel>> getYoutubeJson() async {
    final String response =
        await rootBundle.loadString('assets/json/list_youtube.json');

    List data = await json.decode(response);

    final List<YoutubeModel> listYoutube =
        data.map((youtube) => YoutubeModel.fromSnapshot(youtube)).toList();

    return listYoutube;
  }

  static Future<List<YoutubeModel>> fetchYoutube() async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('/youtube').get();

    List list = snapshot.value as List;

    final List<YoutubeModel> listArticle =
        list.map((e) => YoutubeModel.fromSnapshot(e)).toList();

    return listArticle;
  }
}
