import 'package:flutter/material.dart';
import 'package:sample_app/Models/Slot.dart';

//Inside the Schedule

class PendingSlot extends StatelessWidget {
  @override
  PendingSlot({this.slot});
  final Slot slot;
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100,
      color: Colors.orange,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  slot.time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Pending Approval',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ]),
    );
  }
}
