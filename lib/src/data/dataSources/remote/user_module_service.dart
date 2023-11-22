import 'package:firebase_database/firebase_database.dart';
import 'package:ta_bsi/src/data/models/user_module_model.dart';

class UserModuleService {
  final DatabaseReference ref = FirebaseDatabase.instance.ref();

  Future<List<UserModuleModel>> setUserModuleToFirebase({
    required String idUser,
    required List<String> idModule,
    required String module,
  }) async {
    Map<dynamic, dynamic> userModuleMap() {
      final Map<dynamic, dynamic> result = {};

      for (var item in idModule) {
        result.addAll({item: false});
      }
      return result;
    }

    await ref.child('user-module/$idUser/$module').set(userModuleMap());

    List<UserModuleModel> list = [];
    for (var i = 0; i < idModule.length; i++) {
      list.add(
        UserModuleModel(
          idUser: idUser,
          idModule: idModule[i],
          isDone: false,
        ),
      );
    }
    return list;
  }

  Future<List<UserModuleModel>> getUserModuleById({
    required String idUser,
    required List<String> idModule,
    required String module,
  }) async {
    // DatabaseReference starCountRef =
    //     FirebaseDatabase.instance.ref('user-module/$idUser');

    final snapshot = await ref.child('user-module/$idUser/$module').get();
    List<UserModuleModel> list = [];

    // List<UserModuleModel>? getDataRealTime() {
    //   var dataRealTime;
    //   starCountRef.onValue.listen((DatabaseEvent event) {
    //     dataRealTime = event.snapshot.value;
    //     list.clear();
    //     for (var i = 0; i < idModule.length; i++) {
    //       list.add(
    //         UserModuleModel(
    //           idUser: idUser,
    //           idModule: dataRealTime.keys.elementAt(i),
    //           isDone: dataRealTime[idModule[i]],
    //         ),
    //       );
    //     }
    //     print('list 1$list');
    //   });
    //   if (dataRealTime != null) {}
    //   print('list 2 $list');
    //   return list;
    // }

    // print('star ${starCountRef.onChildAdded}');

    if (snapshot.value == null) {
      return setUserModuleToFirebase(
        idUser: idUser,
        idModule: idModule,
        module: module,
      );
    } else {
      final value = (snapshot.value as Map);

      for (var i = 0; i < value.length; i++) {
        list.add(
          UserModuleModel(
            idUser: idUser,
            idModule: value.keys.elementAt(i),
            isDone: value[idModule[i]],
          ),
        );
      }
      return list;
    }
  }

  void updateUserModuleDone({
    required String idUser,
    required String idModule,
    required bool moduleDone,
    required String typeModule,
  }) async {
    await ref.child('user-module/$idUser/$typeModule').update({
      idModule: moduleDone,
    });
  }
}
