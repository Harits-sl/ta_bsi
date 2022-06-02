import 'package:flutter/material.dart';
import 'package:ta_bsi/src/data/models/course_model.dart';

import 'package:ta_bsi/theme.dart';

class CardCourse extends StatelessWidget {
  const CardCourse({
    Key? key,
    required this.course,
  }) : super(key: key);

  final CourseModel course;

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
            course.imageUrl,
            width: 35,
          ),
          const SizedBox(height: 12),
          Text(
            course.course,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            course.description,
            style: darkGreyTextStyle.copyWith(
              fontSize: 11,
              fontWeight: light,
            ),
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            '${course.manyLesson} materi',
            style: blackTextStyle.copyWith(
              fontSize: 11,
              fontWeight: light,
            ),
          ),
        ],
      ),
    );
  }
}
