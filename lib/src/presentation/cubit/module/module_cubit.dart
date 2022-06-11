import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/remote/module_service.dart';
import 'package:ta_bsi/src/data/models/module_model.dart';

part 'module_state.dart';

class ModuleCubit extends Cubit<ModuleState> {
  ModuleCubit() : super(ModuleInitial());

  void fetchListModule(String module) async {
    try {
      emit(ModuleLoading());

      List<ModuleModel> _module = await ModuleService.fetchModule(module);

      emit(ModuleSuccess(_module));
    } catch (e) {
      emit(ModuleFailed(e.toString()));
    }
  }
}
