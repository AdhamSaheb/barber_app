import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/Pages/Closed.dart';
import 'package:sample_app/Pages/Loading.dart';
import 'package:sample_app/Pages/Notyet.dart';
import 'package:sample_app/SecondChairPages/MyForm2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Booking2 extends StatefulWidget {
  // to check wether navigated user is a barber
  @required
  final bool isBarber;
  Booking2({this.isBarber});
  @override
  _Booking2State createState() => _Booking2State();
}

class _Booking2State extends State<Booking2> {
  dynamic times;
  dynamic _currentTime;
  //api to get time jerusalem
  final String apiUrl = "http://worldtimeapi.org/api/timezone/Asia/Jerusalem";

//get opening and closing times from firestore
  Future<dynamic> getTimes() async {
    final DocumentReference document =
        Firestore.instance.collection("Times").document('times');

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        times = snapshot.data;
      });
    });
  }

//get the time in jerusalem
  _findTime() async {
    try {
      // _currentTime = await NTP.now();
      var result = await http.get(apiUrl);
      setState(() {
        //print("imhere");
        _currentTime =
            DateTime.parse(json.decode(result.body)['datetime']).toLocal();
      });
    } catch (e) {
      print("caught");
      setState(() {
        _currentTime = DateTime.now().toLocal();
      });
    }
  }

  String getTime() {
    DateTime now = _currentTime;
    String formattedDate = DateFormat('EEEE yyyy-MM-dd – kk:mm').format(now);
    return formattedDate;
  }

  // bool isSameDate() {
  //   // print("Timezone" + _currentTime.timeZoneName);
  //   if (_currentTime.day != DateTime.now().day ||
  //       _currentTime.month != DateTime.now().month ||
  //       _currentTime.year != DateTime.now().year ||
  //       _currentTime.hour != DateTime.now().hour) return false;
  //   return true;
  // }

  // bool sameTimeZone() {
  //   if (_currentTime.timeZoneName == "IDT" ||
  //       _currentTime.timeZoneName == "IST" ||
  //       _currentTime.timeZoneName == "PSE" ||
  //       _currentTime.timeZoneName == "PS" ||
  //       _currentTime.timeZoneName == "EEST") return true;
  //   return false;
  // }

  @override
  void initState() {
    super.initState();
    getTimes();
    _findTime();
  }

  @override
  Widget build(BuildContext context) {
    //let barbers in no matter what
    if (widget.isBarber) return MainBody();
    if (times == null || _currentTime == null) return Loading();
    if (times['isEddyClosed'] == true) return Closed();
    // if (!isSameDate() || !sameTimeZone()) return noConnection();

    return (_currentTime.weekday == 7)
        ? Closed()
        : (_currentTime.hour < times['start'] ||
                _currentTime.hour >= times['end'])
            ? NotYet()
            : MainBody();
  }
}

class MainBody extends StatelessWidget {
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
              Column(
                children: [
                  Hero(
                    tag: 'eddy',
                    child: Image(
                      image: AssetImage('Images/eddy.png'),
                      height: 100,
                      width: 90,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black87),
                    // color: Colors.black87,
                    // width: double.infinity,
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      DateFormat('EEEE yyyy-MM-dd – kk:mm')
                          .format(DateTime.now()),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'ChelseaMarket',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
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
