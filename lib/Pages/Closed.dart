import 'package:flutter/material.dart';

class Closed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: 50,
            ),
            Text(
              'OH No !',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lobster'),
            ),
            Image(image: AssetImage('Images/closed.png')),
            SizedBox(
              height: 10,
            ),
            Text(
              'Today is our day off ! We\'re sorry ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
            ),
          ]),
        ));
  }
}
