import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ta_bsi/src/data/models/youtube_model.dart';

class YoutubeService {
  static Future<List<YoutubeModel>> getYoutubeJson() async {
    final String response =
        await rootBundle.loadString('assets/json/list_youtube.json');

    List data = await json.decode(response);

    final List<YoutubeModel> listYoutube =
        data.map((youtube) => YoutubeModel.fromJson(youtube)).toList();

    return listYoutube;
  }
}
