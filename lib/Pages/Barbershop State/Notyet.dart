import 'package:flutter/material.dart';

class NotYet extends StatelessWidget {
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Not Yet !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster'),
                ),
                SizedBox(
                  height: 50,
                ),
                Image(image: AssetImage('Images/notYet.png')),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Reservation has not been open yet, Sorry !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ]),
        ));
  }
}
