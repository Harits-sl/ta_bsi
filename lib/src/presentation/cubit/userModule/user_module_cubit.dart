import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ta_bsi/src/data/dataSources/remote/user_module_service.dart';
import 'package:ta_bsi/src/data/models/user_module_model.dart';

part 'user_module_state.dart';

class UserModuleCubit extends Cubit<UserModuleState> {
  UserModuleCubit() : super(UserModuleInitial());

  // void setUserModule({
  //   required String idUser,
  //   required List<String> idModule,
  //   bool isDone = false,
  // }) async {
  //   try {
  //     emit(UserModuleLoading());

  //     Map<dynamic, dynamic> userModuleMap() {
  //       final Map<dynamic, dynamic> result = {};

  //       for (var item in idModule) {
  //         result.addAll({item: isDone});
  //       }
  //       return result;
  //     }

  //     // UserModuleModel userModule =
  //     //     UserModuleModel(idUser: idUser, idModule: idModule, isDone: isDone);

  //     List<UserModuleModel> listUserModule = await UserModuleService()
  //         .setUserModuleToFirebase(idUser: idUser, userModule: userModuleMap());

  //     print('e: $listUserModule');
  //     emit(UserModuleSuccess(listUserModule));
  //   } catch (e) {
  //     print('e: $e');
  //     emit(UserModuleFailed(e.toString()));
  //   }
  // }

  void updateUserModule({
    required String idUser,
    required String idModule,
    required bool moduleDone,
    required String typeModule,
  }) async {
    try {
      debugPrint('typeModule: $typeModule');
      UserModuleService().updateUserModuleDone(
        idUser: idUser,
        idModule: idModule,
        moduleDone: moduleDone,
        typeModule: typeModule,
      );
    } catch (e) {
      emit(UserModuleFailed(e.toString()));
    }
  }

  void getUserModuleById({
    required String idUser,
    required List<String> idModule,
    required String module,
  }) async {
    try {
      emit(UserModuleLoading());

      List<UserModuleModel> userModule =
          await UserModuleService().getUserModuleById(
        idUser: idUser,
        idModule: idModule,
        module: module,
      );

      emit(UserModuleSuccess(userModule));
    } catch (e) {
      print(e);
      emit(UserModuleFailed(e.toString()));
    }
  }
}
