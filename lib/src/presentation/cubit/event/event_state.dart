part of 'event_cubit.dart';

abstract class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventSuccess extends EventState {
  final List<EventModel> event;

  const EventSuccess(this.event);

  @override
  List<Object> get props => [event];
}

class EventFailed extends EventState {
  final String error;

  const EventFailed(this.error);

  @override
  List<Object> get props => [error];
}
