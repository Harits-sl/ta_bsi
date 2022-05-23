import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ta_bsi/src/data/models/detail_module_model.dart';

class DetailModuleService {
  static Future<List<DetailModuleModel>> getDetailModuleJson() async {
    final String response =
        await rootBundle.loadString('assets/json/list_detail_module_dart.json');

    print(response);
    List data = await json.decode(response);

    final List<DetailModuleModel> listModule =
        data.map((module) => DetailModuleModel.fromJson(module)).toList();
    return listModule;
  }
}
