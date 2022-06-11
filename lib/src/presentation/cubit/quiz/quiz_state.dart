part of 'quiz_cubit.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizSuccess extends QuizState {
  final List<QuizModel> quiz;

  const QuizSuccess(this.quiz);

  @override
  List<Object> get props => [quiz];
}

class QuizFailed extends QuizState {
  final String error;

  const QuizFailed(this.error);

  @override
  List<Object> get props => [error];
}
