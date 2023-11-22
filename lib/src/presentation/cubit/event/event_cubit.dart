import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/local/json/event_service.dart';
import 'package:ta_bsi/src/data/models/event_model.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());

  /// variabel list event
  List<EventModel> event = [];

  /// fungsi setEvent untuk mengisi variabel event
  void setEvent(List<EventModel> newEvent) {
    event = newEvent;
  }

  void fetchListEvent() async {
    try {
      emit(EventLoading());

      /// jika [event] masih kosong paggil fungsi setEvent dengan
      /// paramater EventService.fetchEvent()
      if (event.isEmpty) {
        setEvent(await EventService.fetchEvent());
      }

      emit(EventSuccess(event));
    } catch (e) {
      print(e);
      emit(EventFailed(e.toString()));
    }
  }
}
