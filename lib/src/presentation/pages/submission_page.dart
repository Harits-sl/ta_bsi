import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SubmissionPage extends StatelessWidget {
  const SubmissionPage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;
  @override
  Widget build(BuildContext context) {
    String url =
        'https://dartpad.dev/embed-flutter.html?gh_owner=JoseAlba&gh_repo=flutter_code&gh_path=lib/dartpad&theme=dark&run=true&split=50';

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
