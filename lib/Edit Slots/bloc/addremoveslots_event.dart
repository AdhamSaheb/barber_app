part of 'addremoveslots_bloc.dart';

@immutable
abstract class AddremoveslotsEvent {}

class SelectBarber extends AddremoveslotsEvent {
  final String barber;
  SelectBarber(this.barber);
}

class AddSlot extends AddremoveslotsEvent {
  final String time;
  final String barber;
  AddSlot({this.time, this.barber});
}

class RemoveSlot extends AddremoveslotsEvent {
  final String time;
  final String barber;
  RemoveSlot({this.time, this.barber});
}
