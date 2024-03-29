import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ta_bsi/src/data/models/module_model.dart';

class ModuleService {
  static Future<List<ModuleModel>> getModuleJson() async {
    final String response =
        await rootBundle.loadString('assets/json/list_module_dart.json');

    List data = await json.decode(response);

    final List<ModuleModel> listModule =
        data.map((module) => ModuleModel.fromSnapshot(module)).toList();

    return listModule;
  }
}
