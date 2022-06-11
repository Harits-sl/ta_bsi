import 'package:firebase_database/firebase_database.dart';
import 'package:ta_bsi/src/data/models/quiz_model.dart';

class QuizService {
  static Future<List<QuizModel>> fetchQuiz(String module) async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('/quiz/$module').get();

    List list = snapshot.value as List;
    print('keyys ${list[0]}');

    final List<QuizModel> listQuiz =
        list.map((e) => QuizModel.fromSnapshot(e)).toList();
    print(listQuiz);

    return listQuiz;
  }
}
