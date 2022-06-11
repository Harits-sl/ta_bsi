import 'package:equatable/equatable.dart';

class QuizModel extends Equatable {
  final String question;
  final String imageUrl;
  final Map answer;
  final String correctAnswer;
  final String explanation;

  const QuizModel({
    required this.question,
    required this.imageUrl,
    required this.answer,
    required this.correctAnswer,
    required this.explanation,
  });

  factory QuizModel.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    return QuizModel(
      question: snapshot['question'] ?? '',
      imageUrl: snapshot['image_url'] ?? '',
      answer: snapshot['answer'],
      correctAnswer: snapshot['correct_answer'] ?? '',
      explanation: snapshot['explanation'] ?? '',
    );
  }

  @override
  List<Object> get props =>
      [question, imageUrl, answer, correctAnswer, explanation];
}
