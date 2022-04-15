import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ta_bsi/src/data/models/course_model.dart';

class CourseService {
  static Future<List<CourseModel>> getCourseJson() async {
    final String response =
        await rootBundle.loadString('assets/json/list_course.json');

    List data = await json.decode(response);

    final List<CourseModel> listCourse =
        data.map((course) => CourseModel.fromJson(course)).toList();

    return listCourse;
  }
}
