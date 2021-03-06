import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/local/json/module_service.dart';
import 'package:ta_bsi/src/data/models/module_model.dart';

part 'module_state.dart';

class ModuleCubit extends Cubit<ModuleState> {
  ModuleCubit() : super(ModuleInitial());

  void fetchListModule() async {
    try {
      emit(ModuleLoading());

      List<ModuleModel> module = await ModuleService.getModuleJson();

      emit(ModuleSuccess(module));
    } catch (e) {
      emit(ModuleFailed(e.toString()));
    }
  }
}
