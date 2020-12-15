import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_app/Pages/Loading.dart';

class ClosedToggler extends StatefulWidget {
  @required
  final String barber;

  ClosedToggler({this.barber});
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
    //murad toggle switch
    if (widget.barber == 'Murad')
      await document.updateData({'isMuradClosed': !times['isMuradClosed']});
    //eddy toggle switch
    else if (widget.barber == 'Eddy')
      await document.updateData({'isEddyClosed': !times['isEddyClosed']});
  }

  @override
  void initState() {
    super.initState();
    //read database to set initial state
    getTimes();
  }

  @override
  Widget build(BuildContext context) {
    return (times == null)
        ? Loading()
        : Switch(
            activeColor: Colors.red[400],
            activeTrackColor: Colors.red[400],
            //initial value of toggle switcher
            value: (widget.barber == 'Murad')
                ? times['isMuradClosed']
                : times['isEddyClosed'],
            //value: times['isEddyClosed'],
            onChanged: (value) {
              setState(() {
                toggleClose();
                //difference : toggle local button state
                //murad toggle switch
                if (widget.barber == 'Murad')
                  times['isMuradClosed'] = !times['isMuradClosed'];
                //eddy toggle switch
                else if (widget.barber == 'Eddy')
                  times['isEddyClosed'] = !times['isEddyClosed'];
              });
            },
          );
  }
}
