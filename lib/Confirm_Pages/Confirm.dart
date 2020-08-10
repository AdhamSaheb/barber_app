import 'package:flutter/material.dart';
import 'package:sample_app/Confirm_Pages/Pending_list.dart';
import 'package:sample_app/Services/Database.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Models/Slot.dart';

class Confirm extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<List<Slot>>.value(
        value: DatabaseService().slots,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
      appBar: AppBar(
          leading: BackButton(
          color: Colors.black
   ), 
        title: Text(
          'Pending Requests',
          style: TextStyle(
            fontFamily: 'ChelseaMarket',
            color: Colors.black,
            letterSpacing: 2.0,
          ),
          ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
        body: PendingList(collection : "slotcollection")
      ),
    );
  }
}