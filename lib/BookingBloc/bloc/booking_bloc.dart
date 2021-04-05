import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample_app/Services/Time.dart';
import 'package:ntp/ntp.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial());
  TimeService _timeService = new TimeService();
  @override
  Stream<BookingState> mapEventToState(
    BookingEvent event,
  ) async* {
    if (event is FetchData) {
      yield BookingLoading();
      try {
        //fetch data from data base
        dynamic now = await NTP.now();
        Map<String, int> times = await _timeService.getOpenCloseTime();
        Map<String, bool> state = await _timeService.getBarbershopState();

        /*Decide State*/
        //check if user has changed date manually and reject his access
        DateTime nowLocal = DateTime.now();
        if (now.day != nowLocal.day ||
            now.month != nowLocal.month ||
            now.year != nowLocal.year) {
          print(now.day != nowLocal.day);
          yield BookingFailed();
        } else if (event.isBarber)
          yield BookingLoaded(now: now);
        else if ((event.barberName == 'Murad' && state['isMuradClosed']) ==
                true ||
            (event.barberName == 'Eddy' && state['isEddyClosed'] == true))
          yield BookingClosed();
        else if (now.hour >= times['start'] && now.hour < times['end'])
          yield BookingLoaded(now: now);
        else
          yield BookingNotYet();
      } catch (error) {
        print("Error ! :" + error.toString());
        yield BookingFailed();
      }
    }
  }
}
