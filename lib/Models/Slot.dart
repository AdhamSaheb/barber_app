import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ntp/ntp.dart';

class Slot {
  String time;
  String phone;
  String name;
  Timestamp reservationTime;
  bool pending;

  Slot({this.time, this.phone, this.name, this.reservationTime, this.pending});

  bool isReserved() {
    if (reservationTime.toDate().day == DateTime.now().day &&
        reservationTime.toDate().month == DateTime.now().month &&
        reservationTime.toDate().year == DateTime.now().year) return true;
    return false;
  }

  bool isPending() {
    if (this.pending == true) return true;
    return false;
  }
}
