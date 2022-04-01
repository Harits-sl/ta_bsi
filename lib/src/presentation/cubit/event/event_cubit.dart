import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/local/json/event_service.dart';
import 'package:ta_bsi/src/data/models/event_model.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());

  void fetchListEvent() async {
    try {
      emit(EventLoading());

      List<EventModel> event = await EventService.getEventJson();

      emit(EventSuccess(event));
    } catch (e) {
      emit(EventFailed(e.toString()));
    }
  }
}
