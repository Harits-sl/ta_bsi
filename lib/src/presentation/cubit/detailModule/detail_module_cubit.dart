import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/local/json/detail_module_service.dart';
import 'package:ta_bsi/src/data/models/detail_module_model.dart';

part 'detail_module_state.dart';

class DetailModuleCubit extends Cubit<DetailModuleState> {
  DetailModuleCubit() : super(DetailModuleInitial());

  void fetchListModule(String idModule) async {
    try {
      emit(DetailModuleLoading());

      List<DetailModuleModel> module =
          await DetailModuleService.getDetailModuleJson();

      Future<DetailModuleModel> findDetailModule() async {
        DetailModuleModel _course =
            module.where((item) => item.id == idModule).toList().first;
        return _course;
      }

      Future<List> splitHtml() async {
        List listMateri = [];
        DetailModuleModel detailModule = await findDetailModule();
        // clear terlebih dahulu karena setiap render ulang memanggil fungsi ini
        // listMateri.clear();
        // melakukan split html <div>
        List<String> split = detailModule.materi.split("<div>");

        // tambahkan lagi <div>
        for (int i = 0; i < split.length; i++) {
          split[i] = '<div>' + split[i];

          // memasukan data yang sudah ditambahkan div kedalam list
          listMateri.add(split[i]);
        }

        // hapus list pertama karena list pertama kosong
        listMateri.remove('<div>');

        print(listMateri.length);

        return listMateri;
      }

      emit(DetailModuleSuccess(await findDetailModule(), await splitHtml()));
    } catch (e) {
      emit(DetailModuleFailed(e.toString()));
    }
  }
}

class IndexDetailModuleCubit extends Cubit<int> {
  IndexDetailModuleCubit() : super(0);
  int _index = 0;

  void incrementIndex() {
    emit(_index++);
  }
}
