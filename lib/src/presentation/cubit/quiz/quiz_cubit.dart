import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/remote/quiz_service.dart';
import 'package:ta_bsi/src/data/models/quiz_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  /// variabel list Quiz
  List<QuizModel> _quiz = [];
  String typeModule = '';
  String idQuiz = '';

  /// fungsi setQuiz untuk mengisi variabel Quiz
  void setQuiz(List<QuizModel> newQuiz) {
    _quiz = newQuiz;
  }

  void setTypeModule(String newValue) {
    typeModule = newValue;
  }

  void setIdQuiz(String newValue) {
    idQuiz = newValue;
  }

  void fetchListQuiz() async {
    try {
      emit(QuizLoading());

      setQuiz(await QuizService.fetchQuiz(typeModule));

      emit(QuizSuccess(_quiz));
    } catch (e) {
      emit(QuizFailed(e.toString()));
      print('error quiz cubit $e');
    }
  }
}
