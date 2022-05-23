part of 'detail_module_cubit.dart';

abstract class DetailModuleState extends Equatable {
  const DetailModuleState();

  @override
  List<Object> get props => [];
}

class DetailModuleInitial extends DetailModuleState {}

class DetailModuleLoading extends DetailModuleState {}

class DetailModuleSuccess extends DetailModuleState {
  final DetailModuleModel module;
  final List listMateri;

  const DetailModuleSuccess(this.module, this.listMateri);

  // DetailModuleModel findDetailModule() {
  //   DetailModuleModel _course =
  //       module.where((item) => item.id == id).toList().first;
  //   print(_course);
  //   return _course;
  // }

  // List listMateri = [];
  // List splitHtml() {
  //   List _listmateri = [];
  //   DetailModuleModel detailModule = findDetailModule();
  //   // clear terlebih dahulu karena setiap render ulang memanggil fungsi ini
  //   // listMateri.clear();
  //   // melakukan split html <div>
  //   List<String> split = detailModule.materi.split("<div>");

  //   // tambahkan lagi <div>
  //   for (int i = 0; i < split.length; i++) {
  //     split[i] = '<div>' + split[i];

  //     // memasukan data yang sudah ditambahkan div kedalam list
  //     _listmateri.add(split[i]);
  //   }

  //   // hapus list pertama karena list pertama kosong
  //   _listmateri.remove('<div>');

  //   print(_listmateri.length);
  //   return _listmateri;
  // }

  @override
  List<Object> get props => [module, listMateri];
}

class DetailModuleFailed extends DetailModuleState {
  final String error;

  const DetailModuleFailed(this.error);

  @override
  List<Object> get props => [error];
}
