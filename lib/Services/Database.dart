//import 'dart:js_util';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_app/Models/Slot.dart';

class DatabaseService {
  //reference to slots collection
  final CollectionReference slotcollection =
      Firestore.instance.collection("Slots");
  final CollectionReference slotcollection2 =
      Firestore.instance.collection("Slots2");

  List<Slot> _slotListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Slot(
        time: doc.data['Time'] ?? '',
        phone: doc.data['Phone'] ?? '',
        name: doc.data['Name'] ?? '',
        reservationTime: doc.data['reservationTime'] ?? Timestamp.now(),
        pending: doc.data['pending'] ?? false,
      );
    }).toList();
  }

  void updatedata(String name, String phone, String time) async {
    slotcollection.document(time).updateData({
      'Phone': phone,
      'Name': name,
      //'reservationTime' : Timestamp.now(),
      'pending': true,
    });
  }

  void updatedata2(String name, String phone, String time) {
    slotcollection2.document(time).updateData({
      'Phone': phone,
      'Name': name,
      //'reservationTime' : Timestamp.now(),
      'pending': true
    });
  }

  void confirmReservation(
      String collection, String name, String phone, String time) {
    if (collection == 'slotcollection') {
      slotcollection.document(time).updateData({
        'Phone': phone,
        'Name': name,
        'reservationTime': Timestamp.now(),
        'pending': false
      });
    } else {
      slotcollection2.document(time).updateData({
        'Phone': phone,
        'Name': name,
        'reservationTime': Timestamp.now(),
        'pending': false
      });
    }
  }

  void declineReservation(String collection, String time) {
    if (collection == 'slotcollection') {
      slotcollection.document(time).updateData({'pending': false});
    } else {
      slotcollection2.document(time).updateData({'pending': false});
    }
  }

//used to remove a false/mistake reservation
  void removeReservation(String collection, String time) {
    final now = DateTime.now();
    if (collection == 'slotcollection') {
      slotcollection.document(time).updateData({
        'pending': false,
        'reservationTime': DateTime(now.year, now.month, now.day - 1),
      });
    } else {
      slotcollection2.document(time).updateData({
        'pending': false,
        'reservationTime': DateTime(now.year, now.month, now.day - 1),
      });
    }
  }

//used to reserve an eating break
  void reserveEatingBreak(String collection, String time) {
    final now = DateTime.now();
    if (collection == 'slotcollection') {
      slotcollection.document(time).updateData({
        'pending': false,
        'reservationTime': DateTime(now.year, now.month, now.day),
        'Name': 'Eating break',
        'Phone': '0000',
      });
    } else {
      slotcollection2.document(time).updateData({
        'pending': false,
        'reservationTime': DateTime(now.year, now.month, now.day),
        'Name': 'Eating break',
        'Phone': '0000',
      });
    }
  }

  void init() {
    var times = [
      // '11:30',
      '12:00',
      '12:30',
      '13:00',
      '13:30',
      '14:00',
      '14:30',
      '15:00',
      '15:30',
      '16:00',
      '16:30',
      '17:00',
      '17:30',
      '18:00',
      '18:30',
      '19:00',
      '19:30',
      '20:00',
    ];

    times.forEach((time) {
      final now = DateTime.now();

      slotcollection2.document(time).setData({
        'pending': false,
        'Name': 'Name',
        'Phone': '222222',
        'Time': time,
        'reservationTime': DateTime(now.year, now.month, now.day - 1),
      });
      slotcollection.document(time).setData({
        'pending': false,
        'Name': 'Name',
        'Phone': '222222',
        'Time': time,
        'reservationTime': DateTime(now.year, now.month, now.day - 1),
      });
    });
  }

  //Slot Stream
  Stream<List<Slot>> get slots {
    return slotcollection.snapshots().map(_slotListFromSnapshot);
  }

  //Slot Stream
  Stream<List<Slot>> get slots2 {
    return slotcollection2.snapshots().map(_slotListFromSnapshot);
  }
}
