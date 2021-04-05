import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:sample_app/Services/Database.dart';

part 'reservationstatus_event.dart';
part 'reservationstatus_state.dart';

class ReservationstatusBloc
    extends Bloc<ReservationstatusEvent, ReservationstatusState> {
  ReservationstatusBloc() : super(ReservationstatusInitial());

  @override
  Stream<ReservationstatusState> mapEventToState(
    ReservationstatusEvent event,
  ) async* {
    if (event is FetchReservations) {
      List<Slot> reservations;
      yield ReservationstatusLoading();
      try {
        await DatabaseService().getUserReservation().then((data) {
          reservations = data;
        });
        print(reservations);
        if (reservations.length == 0)
          yield ReservationstatusEmpty();
        else
          yield ReservationstatusLoaded(reservations: reservations);
      } catch (error) {
        print("error ! : " + error.toString());
        yield ReservationstatusFailed();
      }
    }
  }
}
