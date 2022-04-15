import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/local/json/course_service.dart';
import 'package:ta_bsi/src/data/models/course_model.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  void fetchListCourse() async {
    try {
      emit(CourseLoading());

      List<CourseModel> listCourse = await CourseService.getCourseJson();

      emit(CourseSuccess(listCourse));
    } catch (e) {
      emit(CourseFailed(e.toString()));
    }
  }
}
