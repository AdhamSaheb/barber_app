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
      appBar: AppBar(
        
        //centerTitle: true,
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          
        ), 
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            SizedBox(width: 20),
            Text(
              'Get an Appointment',
              style: TextStyle(
                letterSpacing: 2.0,
                color: Colors.black,
                fontFamily: 'ChelseaMarket',
                fontSize: 20
              ),
            )
          ],
        ),
        //elevation: 0.0,
      ),
    body: 
    
       SingleChildScrollView(
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
                ),//this is where the black box ends 
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