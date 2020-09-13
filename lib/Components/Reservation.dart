import 'package:flutter/material.dart';
import 'package:sample_app/Components/FreeSlot.dart';
import 'package:sample_app/Components/pendingSlot.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:sample_app/Services/Database.dart';

//Inside the Schedule

class Reservation extends StatelessWidget {
  final Slot slot;
  final String collection;
  @override
  Reservation({this.slot, this.collection});
  final databaseService = new DatabaseService();

  String to12format(String time) {
    var times = time.split(':');
    var temp = int.parse(times[0]);

    return (temp > 12)
        ? (temp - 12).toString() + ":" + times[1]
        : time.toString();
  }

  Widget build(BuildContext context) {
    // this will show the dialoug after deleting reservation
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            actionsOverflowButtonSpacing: 15,
            title: Text('Are you sure you want to delete this reservation ?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  //Text('Reservation Successful !'),
                  // Text('Who\'s this ? '),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  if (this.collection == 'slotcollection') {
                    databaseService.removeReservation(
                        'slotcollection', this.slot.time);
                    Navigator.pop(context);
                  } else {
                    databaseService.removeReservation(
                        'slotcollection2', this.slot.time);
                    Navigator.pop(context);
                  }
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    if (slot.isPending() == true) return PendingSlot(slot: slot);
    return (slot.isReserved() == false)
        ? FreeSlot(slot: slot)
        : GestureDetector(
            // container instead of button
            onDoubleTap: () => _showMyDialog(),
            child: Card(
                elevation: 0,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.red[900],
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          to12format(slot.time),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              slot.name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              slot.phone,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ]),
                )),
          );
  }
}
