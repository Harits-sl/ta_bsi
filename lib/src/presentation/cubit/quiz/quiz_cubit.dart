import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/remote/quiz_service.dart';
import 'package:ta_bsi/src/data/models/quiz_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  /// variabel list Quiz
  List<QuizModel> quiz = [];

  /// fungsi setQuiz untuk mengisi variabel Quiz
  void setQuiz(List<QuizModel> newQuiz) {
    quiz = newQuiz;
  }

  void fetchListQuiz(String module) async {
    try {
      emit(QuizLoading());

      /// jika [Quiz] masih kosong paggil fungsi setQuiz dengan
      /// paramater QuizService.fetchQuiz()
      if (quiz.isEmpty) {
        setQuiz(await QuizService.fetchQuiz(module));
      }

      emit(QuizSuccess(quiz));
    } catch (e) {
      emit(QuizFailed(e.toString()));
      print('error quiz cubit $e');
    }
  }
}
