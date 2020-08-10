import 'package:flutter/material.dart';
import 'package:sample_app/Components/FreeSlot.dart';
import 'package:sample_app/Components/pendingSlot.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/Services/authentication.dart';

//Inside the Schedule

class Reservation extends StatelessWidget {
  @override
  final Slot slot;
  Reservation({this.slot});

  Widget build(BuildContext context) {
    if (slot.isPending() == true) return PendingSlot(slot: slot);
    return (slot.isReserved() == false)
        ? FreeSlot(slot: slot)
        : RaisedButton(
            // container instead of button
            onPressed: () => {
              FirebaseAuth.instance.currentUser().then((value) => {
                    if (value != null)
                      {
                        //Implement removing a reservation here
                        print('Not null!')
                      }
                  })
            },
            child: Card(
                child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.red[900],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      slot.time,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          slot.name,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          slot.phone,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ]),
            )),
          );
  }
}
