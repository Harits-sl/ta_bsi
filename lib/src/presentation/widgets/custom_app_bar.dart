import 'package:flutter/material.dart';

import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        top: defaultMargin,
        right: defaultMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Image.asset('assets/images/ic_back.png', width: 24),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
          const SizedBox(width: 24), // hanya untuk spacing
        ],
      ),
    );
  }
}
