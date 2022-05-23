import 'package:flutter/material.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class HeaderBackAndTitle extends StatelessWidget {
  const HeaderBackAndTitle({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Go.back(context);
    }

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
            onTap: () => onTap(),
            child: Image.asset('assets/images/ic_back.png', width: 24),
          ),
          title == null
              ? SizedBox()
              : Text(
                  title!,
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
