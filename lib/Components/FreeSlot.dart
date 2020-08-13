import 'package:flutter/material.dart';
import 'package:sample_app/Models/Slot.dart';

//Inside the Schedule

class FreeSlot extends StatelessWidget {
  @override
  FreeSlot({this.slot});
  final Slot slot;
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100,
      child: Card(
        color: Colors.green,
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
                    'Free',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
