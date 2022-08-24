import 'package:firebase_database/firebase_database.dart';
import 'package:ta_bsi/src/data/models/detail_module_model.dart';

class DetailModuleService {
  static Future<List<DetailModuleModel>> fetchDetailModule(
      String module) async {
    DataSnapshot snapshot =
        await FirebaseDatabase.instance.ref('/detail-module/$module').get();

    List list = snapshot.value as List;

    final List<DetailModuleModel> listDetailModule =
        list.map((e) => DetailModuleModel.fromSnapshot(e)).toList();

    return listDetailModule;
  }
}
