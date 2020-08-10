import 'package:flutter/material.dart';


// inside  the form
class Taken extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: new BoxDecoration(
                color: Colors.red[900],
                borderRadius: new BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.fromLTRB(10,20,10,20),
      child: Text(
        'Taken',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontFamily: 'ChelseaMarket',

        ),
        
        
      ),
    );
  }
}