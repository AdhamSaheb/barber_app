part of 'addremoveslots_bloc.dart';

@immutable
abstract class AddremoveslotsState {}

class AddremoveslotsInitial extends AddremoveslotsState {}

class BarberSelected extends AddremoveslotsState {
  //loaded barber
  final String barber;
  final List<String> times;
  BarberSelected({this.times, this.barber});
}

class LoadingState extends AddremoveslotsState {}
