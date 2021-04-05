import 'package:flutter/material.dart';

class Closed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 0,
            leading: BackButton(
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
        body: Container(
          child: Column(children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'Closed Today',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lobster'),
            ),
            Image(image: AssetImage('Images/closed.png')),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              child: Text(
                'This Barber is not working today, Sorry',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ));
  }
}
