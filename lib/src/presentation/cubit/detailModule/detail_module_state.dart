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
  final String nextId;

  const DetailModuleSuccess(
    this.module,
    this.listMateri,
    this.nextId,
  );

  @override
  List<Object> get props => [module, listMateri];
}

class DetailModuleFailed extends DetailModuleState {
  final String error;

  const DetailModuleFailed(this.error);

  @override
  List<Object> get props => [error];
}
