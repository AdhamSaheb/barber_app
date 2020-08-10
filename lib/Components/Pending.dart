import 'package:flutter/material.dart';

class Pending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: new BoxDecoration(
                color: Colors.orange[900],
                borderRadius: new BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.fromLTRB(10,20,10,20),
      child: Text(
        'Pending',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'ChelseaMarket',

        ),
        
        
      ),
    );
  }
}