import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Components/PendingTile.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:sample_app/Pages/Loading.dart';



class PendingList extends StatelessWidget {
  final String collection; 
  PendingList({this.collection}) ;
  @override
  Widget build(BuildContext context) {
    final slots = Provider.of<List<Slot>>(context);
    //return Text('Hi');
    return (slots==null) ? Loading() : ListView.builder(
      
      padding: EdgeInsets.all(5),
      itemCount: slots.length,
      itemBuilder: (context, index) => PendingTileBuilder(slot:slots[index],collection:this.collection),
      
    );
  }
}