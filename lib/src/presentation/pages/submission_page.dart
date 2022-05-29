import 'package:flutter/material.dart';

class SubmissionPage extends StatelessWidget {
  const SubmissionPage(this.arguments, {Key? key}) : super(key: key);

  final dynamic arguments;
  @override
  Widget build(BuildContext context) {
    Widget body() {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('submission'),
          ],
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
