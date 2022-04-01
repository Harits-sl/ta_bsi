import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ta_bsi/src/data/models/event_model.dart';

class EventService {
  static Future<List<EventModel>> getEventJson() async {
    final String response =
        await rootBundle.loadString('assets/json/list_event.json');

    List data = await json.decode(response);

    final List<EventModel> listEvent =
        data.map((module) => EventModel.fromJson(module)).toList();

    return listEvent;
  }
}
