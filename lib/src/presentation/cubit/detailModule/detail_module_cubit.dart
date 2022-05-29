import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/local/json/detail_module_service.dart';
import 'package:ta_bsi/src/data/models/detail_module_model.dart';

part 'detail_module_state.dart';

class DetailModuleCubit extends Cubit<DetailModuleState> {
  DetailModuleCubit() : super(DetailModuleInitial());

  List listIdMateri = [];
  int indexListIdMateri = 0;
  late DetailModuleModel detailModule;
  late List<DetailModuleModel> module;
  late DetailModuleModel _module;

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

  DetailModuleModel findDetailModule() {
    // DetailModuleModel _course =
    //     module.where((item) => item.id == idModule).toList().first;
    // return _course;
    return module[indexListIdMateri];
  }

  List splitHtml() {
    List listMateri = [];
    DetailModuleModel detailModule = findDetailModule();
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

  void findIndexIdFromListMateri(String idModule) {
    int indexMateri = listIdMateri.indexWhere((id) => id == idModule);
    setIndexListIdMateri(indexMateri);
  }

  void clearState() {
    module.clear();
    _module = _module.clear();

    print('module clear $_module');

    emit(DetailModuleLoading());
  }

  // @override
  // Future<void> close() {
  //   _module.clear();

  //   return super.close();
  // }

  void fetchListModule(String idModule) async {
    try {
      emit(DetailModuleLoading());

      module = setModule(await DetailModuleService.getDetailModuleJson());

      findIndexIdFromListMateri(idModule);

      // DetailModuleModel _module = await findDetailModule();
      _module = _setModule(findDetailModule());

      List _listMateri = splitHtml();

      emit(DetailModuleSuccess(_module, _listMateri));
    } catch (e) {
      print(e);
      emit(DetailModuleFailed(e.toString()));
    }
  }

  void fetchNewListModule() async {
    try {
      emit(DetailModuleLoading());

      DetailModuleModel _module = findDetailModule();
      List _listMateri = splitHtml();

      // findIndexIdFromListMateri(idModule);

      emit(DetailModuleSuccess(_module, _listMateri));
    } catch (e) {
      print(e);
      emit(DetailModuleFailed(e.toString()));
    }
  }
}
