import 'package:flutter/material.dart';

import 'package:ta_bsi/theme.dart';

class ItemButtonAnswer extends StatelessWidget {
  const ItemButtonAnswer({
    Key? key,
    required this.answer,
    required this.keyAnswer,
  }) : super(key: key);

  /// variabel untuk teks yang akan ditampilkan
  final String answer;

  /// variabel untuk pilihan didepan teks answer
  /// contoh 1 2 3 4
  final String keyAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(keyAnswer),
          ),
          Text(answer),
        ],
      ),
    );
  }
}
