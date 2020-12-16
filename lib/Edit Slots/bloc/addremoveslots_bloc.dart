import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_app/Pages/Miscellaneous/Loading.dart';
import 'package:sample_app/SecondChairPages/slotList2.dart';

part 'addremoveslots_event.dart';
part 'addremoveslots_state.dart';

class AddremoveslotsBloc
    extends Bloc<AddremoveslotsEvent, AddremoveslotsState> {
  AddremoveslotsBloc() : super(AddremoveslotsInitial());

  @override
  Stream<AddremoveslotsState> mapEventToState(
    AddremoveslotsEvent event,
  ) async* {
    //select a barber and fetch its data
    if (event is SelectBarber) {
      yield LoadingState();
      //fetch data depending on barber selected
      QuerySnapshot querySnapshot;
      if (event.barber == 'Murad')
        querySnapshot =
            await Firestore.instance.collection("Slots").getDocuments();

      if (event.barber == 'Eddy')
        querySnapshot =
            await Firestore.instance.collection("Slots2").getDocuments();
      //print(querySnapshot.documents);
      List<String> times = List<String>();
      //read times and return them to state
      for (int i = 0; i < querySnapshot.documents.length; i++) {
        var time = querySnapshot.documents[i].data['Time'].toString();
        times.add(time);
        //print(time);
      }
      yield (event.barber == 'Murad')
          ? BarberSelected(times: times, barber: 'Murad')
          : BarberSelected(times: times, barber: 'Eddy');
    }
    //addTime time event
    if (event is AddSlot) {
      //to be return at the end
      QuerySnapshot querySnapshot;

      yield LoadingState();
      if (event.barber == 'Murad') {
        await Firestore.instance
            .collection("Slots")
            .document(event.time)
            .setData({
          'Phone': '0000',
          'Name': 'NEW SLOT',
          'reservationTime': DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 1),
          'pending': false,
          'Time': event.time,
        });
        querySnapshot =
            await Firestore.instance.collection("Slots").getDocuments();
      }
      if (event.barber == 'Eddy') {
        await Firestore.instance
            .collection("Slots2")
            .document(event.time)
            .setData({
          'Phone': 0000,
          'Name': 'NEW SLOT',
          'reservationTime': DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 1),
          'pending': false,
          'Time': event.time,
        });
        querySnapshot =
            await Firestore.instance.collection("Slots2").getDocuments();
      }
      //after adding the slot return new list
      List<String> times = List<String>();
      for (int i = 0; i < querySnapshot.documents.length; i++) {
        var time = querySnapshot.documents[i].data['Time'].toString();
        times.add(time);
      }
      yield (event.barber == 'Murad')
          ? BarberSelected(times: times, barber: 'Murad')
          : BarberSelected(times: times, barber: 'Eddy');
    }
    //event of deleting a time
    if (event is RemoveSlot) {
      yield LoadingState();
      print(event.barber + "-" + event.time);
      //delete documents
      if (event.barber == 'Murad')
        await Firestore.instance
            .collection("Slots")
            .document(event.time)
            .delete();
      if (event.barber == 'Eddy')
        await Firestore.instance
            .collection("Slots2")
            .document(event.time)
            .delete();
      //fetch data depending on barber selected
      //print('Im here');
      QuerySnapshot querySnapshot;
      if (event.barber == 'Murad')
        querySnapshot =
            await Firestore.instance.collection("Slots").getDocuments();

      if (event.barber == 'Eddy')
        querySnapshot =
            await Firestore.instance.collection("Slots2").getDocuments();
      //print(querySnapshot.documents);
      List<String> times = List<String>();
      //read times and return them to state
      for (int i = 0; i < querySnapshot.documents.length; i++) {
        var time = querySnapshot.documents[i].data['Time'].toString();
        times.add(time);
        //print(time);
      }
      yield (event.barber == 'Murad')
          ? BarberSelected(times: times, barber: 'Murad')
          : BarberSelected(times: times, barber: 'Eddy');
    }
  }
}
