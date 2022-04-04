import 'package:flutter/material.dart';
import 'package:ta_bsi/src/presentation/widgets/card_course.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Go.routeWithPath(context: context, path: '/module');
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/img_avatar.jpg',
              width: 35,
              height: 35,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai,...',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'mau belajar apa hari ini?',
                  style: darkGrayTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget course() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: CardCourse(),
            ),
            GestureDetector(
              onTap: onTap,
              child: CardCourse(),
            ),
            GestureDetector(
              onTap: onTap,
              child: CardCourse(),
            ),
          ],
        ),
      );
    }

    Widget body() {
      return ListView(
        children: [
          header(),
          course(),
        ],
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
