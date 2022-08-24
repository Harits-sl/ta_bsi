import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ta_bsi/src/utils/route/go.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Go.routeWithPathAndRemove(context: context, path: '/sign-in');
    });
  }

  Widget body() {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: 125,
        height: 125,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }
}
