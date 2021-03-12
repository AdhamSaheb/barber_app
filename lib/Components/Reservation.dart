import 'package:flutter/material.dart';
import 'package:sample_app/Components/FreeSlot.dart';
import 'package:sample_app/Components/pendingSlot.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:sample_app/Services/Database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';
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
        ? FreeSlot(
            slot: slot,
            collection: this.collection,
          )
        : Slidable(
            actionPane: SlidableStrechActionPane(),
            actionExtentRatio: 0.3,
            child: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              color: Colors.red,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(
                        Icons.timer,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        to12format(slot.time),
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ]),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          slot.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          slot.phone,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ]),
            ),
            actions: [
              IconSlideAction(
                  closeOnTap: true,
                  caption: 'Cancel',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () => _showMyDialog()),
              IconSlideAction(
                  closeOnTap: true,
                  caption: 'Call',
                  color: Colors.green,
                  icon: Icons.phone,
                  onTap: () => {launch("tel://" + this.slot.phone)}),
            ],
          );
  }
}
