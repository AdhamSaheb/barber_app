import 'package:flutter/material.dart';
import 'package:sample_app/Pages/ReservationList.dart';
import 'package:sample_app/Services/Database.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Models/Slot.dart';

class Query extends StatelessWidget {
  //This will show the schedule for Both barbers
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Slot>>.value(
      value: DatabaseService().slots,
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(color: Colors.black),
            title: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Murad\'s Schedule',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: 10,
                ),
                Hero(
                  tag: 'Murad',
                  child: Image(
                    image: AssetImage('Images/Murad.png'),
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: ReservationList()),
    );
  }
}
