import 'package:flutter/material.dart';
import 'package:ta_bsi/theme.dart';

class CardCourse extends StatelessWidget {
  const CardCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: grayColor),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 12),
            child: Image.asset(
              'assets/images/ic_flutter.png',
              width: 50,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flutter',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '10 Lessons',
                style: darkGrayTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
