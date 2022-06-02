import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/data/models/course_model.dart';
import 'package:ta_bsi/src/presentation/cubit/course/course_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/card_course.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<CourseCubit>().fetchListCourse();
  }

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
              'assets/images/img_avatar.png',
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
                  style: darkGreyTextStyle.copyWith(
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

    Widget course(List<CourseModel> listCourse) {
      int index = 0; // untuk menentukan margin
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
            const SizedBox(height: 12),
            Column(
              children: listCourse.map((course) {
                index++;
                return GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: index == listCourse.length ? 0 : 10,
                    ),
                    child: CardCourse(course: course),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    }

    Widget body() {
      return BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          if (state is CourseLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CourseSuccess) {
            return ListView(
              children: [
                header(),
                course(state.course),
              ],
            );
          }
          return const SizedBox();
        },
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
