import 'package:flutter/material.dart';
import 'package:ta_bsi/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    required this.onTap,
  }) : super(key: key);

  final String? title;
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
          title == null
              ? Container()
              : Expanded(
                  child: Text(
                    title!,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          const SizedBox(width: 24), // hanya untuk spacing
        ],
      ),
    );
  }
}
