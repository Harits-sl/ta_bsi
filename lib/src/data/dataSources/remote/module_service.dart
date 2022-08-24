import 'package:firebase_database/firebase_database.dart';
import 'package:ta_bsi/src/data/models/module_model.dart';

class ModuleService {
  static Future<List<ModuleModel>> fetchModule(String module) async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('/module/$module').get();

    List list = snapshot.value as List;

    final List<ModuleModel> listModule =
        list.map((e) => ModuleModel.fromSnapshot(e)).toList();

    return listModule;
  }
}
