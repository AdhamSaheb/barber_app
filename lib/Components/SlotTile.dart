import 'package:flutter/material.dart';
import 'package:sample_app/Models/Slot.dart';

//Tile inside the form
class SlotTile extends StatefulWidget {
  @override

  final Slot slot; 
  final bool selected; 
  SlotTile({this.slot,this.selected} ); 

  @override
  _SlotTileState createState() => _SlotTileState();
}

class _SlotTileState extends State<SlotTile> {
  
  Color myColor = Colors.red[900] ;

  Widget build(BuildContext context) {
    
    return  Container(
         
          decoration: BoxDecoration(
            
            borderRadius: BorderRadius.all(Radius.circular(20)),
          
          color: (widget.selected == true) ? Colors.orangeAccent[700] : Colors.green[600] ),
          padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
          //margin: EdgeInsets.all(10),
          
          child: Text(
                  
                  ( widget.slot.isReserved() == false )  ? widget.slot.time : 'Taken',
                  //widget.slot.time,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontFamily: (widget.selected == true) ? 'Anton' : 'ChelseaMarket',
                  fontSize: (widget.selected == true) ? 20 : 15,
                  color: Colors.white

                  ),
                ),
          );
  }
}