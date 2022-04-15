import 'package:flutter/material.dart';

class Go {
  static void to(BuildContext context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void routeWithPath({
    required BuildContext context,
    required String path,
    Object? arguments,
  }) {
    Navigator.of(context).pushNamed(path, arguments: arguments);
  }

  static void routeWithPathAndRemove(
      {required BuildContext context, required String path, Map? arguments}) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(path, (route) => false, arguments: arguments);
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }
}
