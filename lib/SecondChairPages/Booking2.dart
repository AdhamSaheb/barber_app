import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/SecondChairPages/MyForm2.dart';

String getTime() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  return formattedDate;
}

class Booking2 extends StatefulWidget {
  @override
  _Booking2State createState() => _Booking2State();
}

class _Booking2State extends State<Booking2> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.black87,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                padding: EdgeInsets.all(20),
                child: Text(
                  getTime(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'ChelseaMarket',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ), //this is where the black box ends
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: MyForm2(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
