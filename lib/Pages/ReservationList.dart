import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Components/Reservation.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:sample_app/Pages/Loading.dart';

class ReservationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final slots = Provider.of<List<Slot>>(context);
    //return Text('Hi');
    return (slots == null)
        ? Loading()
        : ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: slots.length,
            itemBuilder: (context, index) => Reservation(slot: slots[index]),
          );
  }
}
