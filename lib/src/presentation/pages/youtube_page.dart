import 'package:flutter/material.dart';
import 'package:ta_bsi/src/data/models/youtube_model.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_in_app_web_view.dart';

class YoutubePage extends StatelessWidget {
  const YoutubePage(this.youtube, {Key? key}) : super(key: key);

  final Object? youtube;

  @override
  Widget build(BuildContext context) {
    final YoutubeModel _youtube = youtube as YoutubeModel;

    return Scaffold(
      body: CustomInAppWebView(idYoutube: _youtube.idYoutube),
    );
  }
}
