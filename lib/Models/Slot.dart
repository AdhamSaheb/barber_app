import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_app/Services/Time.dart';

class Slot {
  String time;
  String phone;
  String name;
  Timestamp reservationTime;
  bool pending;

  Slot({this.time, this.phone, this.name, this.reservationTime, this.pending});

  bool isReserved() {
    // dynamic now = this.service.getJLMTime();
    DateTime now = DateTime.now();
    return (reservationTime.toDate().day == now.day &&
        reservationTime.toDate().month == now.month &&
        reservationTime.toDate().year == now.year);
  }

  bool isTaken(DateTime now) {
    // dynamic now = this.service.getJLMTime();
    //print(reservationTime.toDate());
    return (reservationTime.toDate().day == now.day &&
        reservationTime.toDate().month == now.month &&
        reservationTime.toDate().year == now.year);
  }

  bool isPending() {
    if (this.pending == true) return true;
    return false;
  }
}
