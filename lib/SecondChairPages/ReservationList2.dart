import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Components/Reservation.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:sample_app/Pages/Miscellaneous/Loading.dart';

class ReservationList2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final slots = Provider.of<List<Slot>>(context);
    //return Text('Hi');
    return (slots == null)
        ? Loading()
        : ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: slots.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Reservation(
                  slot: slots[index],
                  collection: 'slotcollection2',
                ),
              ),
            ),
          );
  }
}
