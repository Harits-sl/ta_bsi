import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/data/dataSources/remote/detail_module_service.dart';
import 'package:ta_bsi/src/data/models/detail_module_model.dart';

part 'detail_module_state.dart';

class DetailModuleCubit extends Cubit<DetailModuleState> {
  DetailModuleCubit() : super(DetailModuleInitial());

  List listIdMateri = [];
  int indexListIdMateri = 0;
  late DetailModuleModel detailModule;
  late List<DetailModuleModel> module;
  late DetailModuleModel _module;
  // late String _id;

  // void setIdModule(String value) {
  //   _id = value;
  // }

  void setListIdMateri(List newListIdMateri) {
    listIdMateri = newListIdMateri;
  }

  void setIndexListIdMateri(int newListIndexListMateri) {
    indexListIdMateri = newListIndexListMateri;
  }

  void incrementIndexListIdMateri() {
    indexListIdMateri++;
  }

  List<DetailModuleModel> setModule(List<DetailModuleModel> newModule) {
    return newModule;
  }

  DetailModuleModel _setModule(DetailModuleModel newModule) {
    return newModule;
  }

  DetailModuleModel _findDetailModule() {
    // DetailModuleModel _course =
    //     module.where((item) => item.id == idModule).toList().first;
    // return _course;
    return module[indexListIdMateri];
  }

  List _splitHtml() {
    List listMateri = [];
    DetailModuleModel detailModule = _findDetailModule();
    // melakukan split html <div>
    List<String> split = (detailModule).materi.split("<div>");

    // tambahkan lagi <div>
    for (int i = 0; i < split.length; i++) {
      split[i] = '<div>' + split[i];

      // memasukan data yang sudah ditambahkan div kedalam list
      listMateri.add(split[i]);
    }

    // hapus list pertama karena list pertama kosong
    listMateri.remove('<div>');

    return listMateri;
  }

  void _findIndexIdFromListMateri(String idModule) {
    int indexMateri = listIdMateri.indexWhere((id) => id == idModule);
    setIndexListIdMateri(indexMateri);
  }

  void fetchListModule(String idModule, String typeModule) async {
    try {
      emit(DetailModuleLoading());

      module =
          setModule(await DetailModuleService.fetchDetailModule(typeModule));

      _findIndexIdFromListMateri(idModule);

      // DetailModuleModel _module = await findDetailModule();
      _module = _setModule(_findDetailModule());

      List _listMateri = _splitHtml();
      String _nextId = listIdMateri[indexListIdMateri + 1];

      emit(DetailModuleSuccess(_module, _listMateri, _nextId));
    } catch (e) {
      print(e);
      emit(DetailModuleFailed(e.toString()));
    }
  }

  void fetchNewListModule() async {
    try {
      emit(DetailModuleLoading());

      DetailModuleModel _module = _findDetailModule();
      List _listMateri = _splitHtml();

      String _nextId = listIdMateri[indexListIdMateri + 1];

      // findIndexIdFromListMateri(idModule);

      emit(DetailModuleSuccess(_module, _listMateri, _nextId));
    } catch (e) {
      print(e);
      emit(DetailModuleFailed(e.toString()));
    }
  }
}
