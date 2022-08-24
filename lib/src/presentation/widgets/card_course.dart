import 'package:flutter/material.dart';

import 'package:ta_bsi/theme.dart';

class CardCourse extends StatelessWidget {
  const CardCourse({
    Key? key,
    required this.module,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  final String module;
  final String imageUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 0.5,
          color: greyColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 35,
          ),
          const SizedBox(height: 12),
          Text(
            module,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: darkGreyTextStyle.copyWith(
              fontSize: 11,
              fontWeight: light,
            ),
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          // const SizedBox(height: 8),
          // Text(
          //   '${course.manyLesson} materi',
          //   style: blackTextStyle.copyWith(
          //     fontSize: 11,
          //     fontWeight: light,
          //   ),
          // ),
        ],
      ),
    );
  }
}
