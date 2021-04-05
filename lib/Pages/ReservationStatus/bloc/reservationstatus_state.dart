part of 'reservationstatus_bloc.dart';

@immutable
abstract class ReservationstatusState {}

class ReservationstatusInitial extends ReservationstatusState {}

class ReservationstatusLoading extends ReservationstatusState {}

class ReservationstatusLoaded extends ReservationstatusState {
  final List<Slot> reservations;
  ReservationstatusLoaded({this.reservations});
}

class ReservationstatusEmpty extends ReservationstatusState {}

class ReservationstatusFailed extends ReservationstatusState {}
