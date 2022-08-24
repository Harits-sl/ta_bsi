import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/data/models/course_model.dart';
import 'package:ta_bsi/src/presentation/cubit/auth/auth_cubit.dart';
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
    void onTap(String module) {
      Go.routeWithPath(
        context: context,
        path: '/module',
        arguments: {
          'module': module,
        },
      );
    }

    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
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
                        'Hai, ${state.user.name}',
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
          return const SizedBox();
        },
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
            // Column(
            //   children: listCourse.map((course) {
            //     index++;
            //     return GestureDetector(
            //       onTap: onTap,
            //       child: Container(
            //         margin: EdgeInsets.only(
            //           bottom: index == listCourse.length ? 0 : 10,
            //         ),
            //         child: CardCourse(course: course),
            //       ),
            //     );
            //   }).toList(),
            // ),
            Column(
              children: [
                GestureDetector(
                  onTap: () => onTap('dart'),
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: index == listCourse.length ? 0 : 10,
                    ),
                    child: const CardCourse(
                      module: 'Dart',
                      imageUrl: 'assets/images/ic_dart.png',
                      description:
                          'Mempelajari dasar-dasar bahasa pemrograman dart, seperti variabel, comment dsb.',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => onTap('flutter'),
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: index == listCourse.length ? 0 : 10,
                    ),
                    child: const CardCourse(
                      module: 'Flutter',
                      imageUrl: 'assets/images/ic_flutter.png',
                      description:
                          'Mempelajari dasar-dasar framework flutter, widget yang akan dipelajari yaitu Text, Image, Column, dsb.',
                    ),
                  ),
                ),
              ],
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
