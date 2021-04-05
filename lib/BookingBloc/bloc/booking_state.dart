part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoaded extends BookingState {
  final DateTime now;
  BookingLoaded({this.now});
}

class BookingClosed extends BookingState {}

class BookingNotYet extends BookingState {}

class BookingFailed extends BookingState {}

class BookingLoading extends BookingState {}
