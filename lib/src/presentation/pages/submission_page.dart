import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SubmissionPage extends StatelessWidget {
  const SubmissionPage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;
  @override
  Widget build(BuildContext context) {
    String url =
        'https://dartpad.dev/embed-inline.html?id=5d70bc1889d055c7a18d35d77874af88';

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
