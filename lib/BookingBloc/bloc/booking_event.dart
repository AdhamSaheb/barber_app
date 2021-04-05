part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class FetchData extends BookingEvent {
  //to check which closed to check when returning closed
  final String barberName;
  final bool isBarber;
  FetchData({this.barberName, this.isBarber});
}
