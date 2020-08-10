

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
          leading: BackButton(
          color: Colors.black
   ), 
        title: Text(
          'Reservations',
          style: TextStyle(
            fontFamily: 'ChelseaMarket',
            color: Colors.black,
            letterSpacing: 2.0,
          ),
          ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
        body: ReservationList2()
      ),
    );
  }
}