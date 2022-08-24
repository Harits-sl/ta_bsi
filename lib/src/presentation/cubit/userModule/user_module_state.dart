part of 'user_module_cubit.dart';

abstract class UserModuleState extends Equatable {
  const UserModuleState();

  @override
  List<Object> get props => [];
}

class UserModuleInitial extends UserModuleState {}

class UserModuleLoading extends UserModuleState {}

class UserModuleSuccess extends UserModuleState {
  final List<UserModuleModel> userModule;

  const UserModuleSuccess(this.userModule);

  @override
  List<Object> get props => [userModule];
}

class UserModuleFailed extends UserModuleState {
  final String error;

  const UserModuleFailed(this.error);

  @override
  List<Object> get props => [error];
}
