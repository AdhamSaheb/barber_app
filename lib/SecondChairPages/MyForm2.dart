import 'package:flutter/material.dart';
import 'package:sample_app/SecondChairPages/slotList2.dart';
import 'package:sample_app/Services/Database.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class MyForm2 extends StatefulWidget {
  @override
  _MyForm2State createState() => _MyForm2State();
}

class _MyForm2State extends State<MyForm2> {
  @override
  Widget build(BuildContext context) {
    //final slots = Provider.of<QuerySnapshot>(context);
    return StreamProvider<List<Slot>>.value(
      value: DatabaseService().slots2,
      child: Container(width: double.infinity, height: 600, child: SlotList2()),
    );
  }
}
