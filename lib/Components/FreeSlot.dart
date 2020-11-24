import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sample_app/Services/Database.dart';

//Inside the Schedule

class FreeSlot extends StatelessWidget {
  @override
  FreeSlot({this.slot, this.collection});
  final Slot slot;
  final String collection;
  final databaseService = new DatabaseService();

  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0.2,
      child: Container(
        width: double.infinity,
        height: 100,
        child: Card(
          color: Colors.green,
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
                      'Free',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]),
        ),
      ),
      actions: [
        IconSlideAction(
          closeOnTap: true,
          caption: 'Food Break',
          foregroundColor: Colors.white,
          color: Colors.orange,
          iconWidget: Icon(
            Icons.fastfood,
            color: Colors.white,
          ),
          onTap: () => {
            if (this.collection == 'slotcollection')
              {
                databaseService.reserveEatingBreak(
                    'slotcollection', this.slot.time)
              }
            else
              {
                databaseService.reserveEatingBreak(
                    'slotcollection2', this.slot.time)
              }
          },
        )
      ],
    );
  }
}
