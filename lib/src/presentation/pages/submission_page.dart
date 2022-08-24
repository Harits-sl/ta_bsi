import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SubmissionPage extends StatelessWidget {
  const SubmissionPage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;
  @override
  Widget build(BuildContext context) {
    String url =
        'https://dartpad.dev/embed-inline.html?gh_owner=Harits-sl&gh_repo=ta_bsi&gh_path=assets/dartpad&gh_ref=debugging&theme=dark';

    Widget body() {
      return SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(url),
          ),
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
