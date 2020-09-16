import 'package:flutter/material.dart';
import 'package:sample_app/SecondChairPages/ReservationList2.dart';
import 'package:sample_app/Services/Database.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Models/Slot.dart';

class Query2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Slot>>.value(
      value: DatabaseService().slots2,
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(color: Colors.black),
            title: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Eddy\'s Schedule',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: 10,
                ),
                Hero(
                  tag: 'eddy',
                  child: Image(
                    image: AssetImage('Images/eddy.png'),
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: ReservationList2()),
    );
  }
}
