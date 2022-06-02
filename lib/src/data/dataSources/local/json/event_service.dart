import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ta_bsi/src/data/models/event_model.dart';
import 'package:firebase_database/firebase_database.dart';

class EventService {
  static Future<List<EventModel>> getEventJson() async {
    final String response =
        await rootBundle.loadString('assets/json/list_event.json');

    List data = await json.decode(response);

    final List<EventModel> listEvent =
        data.map((module) => EventModel.fromSnapshot(module)).toList();

    return listEvent;
  }

  static Future<List<EventModel>> fetchEvent() async {
    DataSnapshot snapshot = await FirebaseDatabase.instance.ref('/event').get();

    List list = snapshot.value as List;

    final List<EventModel> listEvent =
        list.map((e) => EventModel.fromSnapshot(e)).toList();

    return listEvent;
  }
}
