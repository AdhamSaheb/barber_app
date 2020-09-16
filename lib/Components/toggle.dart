import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_app/Pages/Loading.dart';

class ClosedToggler extends StatefulWidget {
  @override
  _ClosedTogglerState createState() => _ClosedTogglerState();
}

class _ClosedTogglerState extends State<ClosedToggler> {
  dynamic times;

  Future<dynamic> getTimes() async {
    final DocumentReference document =
        Firestore.instance.collection("Times").document('times');

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        times = snapshot.data;
      });
    });
  }

  Future<dynamic> toggleClose() async {
    final DocumentReference document =
        Firestore.instance.collection("Times").document('times');

    await document.updateData({'closed': !times['closed']});
  }

  @override
  void initState() {
    super.initState();
    getTimes();
  }

  @override
  Widget build(BuildContext context) {
    return (times == null)
        ? Loading()
        : Switch(
            activeColor: Colors.red[200],
            activeTrackColor: Colors.red[200],
            value: times['closed'],
            onChanged: (value) {
              setState(() {
                toggleClose();
                times['closed'] = !times['closed'];
              });
            },
          );
  }
}
