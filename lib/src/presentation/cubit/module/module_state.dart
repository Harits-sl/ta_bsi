part of 'module_cubit.dart';

abstract class ModuleState extends Equatable {
  const ModuleState();

  @override
  List<Object> get props => [];
}

class ModuleInitial extends ModuleState {}

class ModuleLoading extends ModuleState {}

class ModuleSuccess extends ModuleState {
  final List<ModuleModel> module;

  const ModuleSuccess(this.module);

  @override
  List<Object> get props => [module];
}

class ModuleFailed extends ModuleState {
  final String error;

  const ModuleFailed(this.error);

  @override
  List<Object> get props => [error];
}
