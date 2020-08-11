import 'package:flutter/material.dart';

// inside  the form
class Taken extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.red[500].withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.red[600],
          borderRadius: new BorderRadius.all(Radius.circular(15))),
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
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
