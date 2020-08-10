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
          leading: BackButton(
          color: Colors.black
   ), 
        title: Text(
          'Murad\'s Schedule ',
          style: TextStyle(
            fontFamily: 'ChelseaMarket',
            color: Colors.black,
            letterSpacing: 2.0,
          ),
          ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
        body: ReservationList()
      ),
    );
  }
}