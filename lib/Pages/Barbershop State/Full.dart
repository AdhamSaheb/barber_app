import 'package:flutter/material.dart';

class Full extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Reservation Full',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lobster'),
            ),
            SizedBox(
              height: 50,
            ),
            FittedBox(
                fit: BoxFit.fitWidth,
                child: Image(image: AssetImage('Images/up.png'))),
            SizedBox(
              height: 50,
            ),
            Text(
              'All of the slots for today are taken , Sorry ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ]),
    );
  }
}
