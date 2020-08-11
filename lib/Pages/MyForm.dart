import 'package:flutter/material.dart';
import 'package:sample_app/Pages/SlotList.dart';
import 'package:sample_app/Services/Database.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    //final slots = Provider.of<QuerySnapshot>(context);
    return StreamProvider<List<Slot>>.value(
      value: DatabaseService().slots,
      child: Container(width: double.infinity, height: 600, child: SlotList()),
    );
  }
}
