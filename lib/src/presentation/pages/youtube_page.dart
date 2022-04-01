import 'package:flutter/material.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_in_app_web_view.dart';

class YoutubePage extends StatelessWidget {
  const YoutubePage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomInAppWebView(idYoutube: arguments['id']),
    );
  }
}
