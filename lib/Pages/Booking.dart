import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/Pages/Closed.dart';
import 'package:sample_app/Pages/Loading.dart';
import 'package:sample_app/Pages/MyForm.dart';
import 'package:sample_app/Pages/Notyet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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
    // _currentTime = await NTP.now();
    var result = await http.get(apiUrl);
    setState(() {
      _currentTime =
          DateTime.parse(json.decode(result.body)['datetime']).toLocal();
    });
    // DateTime.now().toLocal()
  }

  @override
  void initState() {
    super.initState();
    getTimes();
    _findTime();
  }

  String getTime() {
    DateTime now = _currentTime;
    String formattedDate = DateFormat('EEEE yyyy-MM-dd – kk:mm').format(now);
    return formattedDate;
  }

  // bool isSameDate() {
  //   // print("Timezone " + _currentTime.timeZoneName);
  //   // print("Timezone " + DateTime.now().timeZoneName);
  //   // print(_currentTime);
  //   // print(DateTime.now());
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
  Widget build(BuildContext context) {
    if (times == null || _currentTime == null) return Loading();
    if (times['closed'] == true) return Closed();
    // if (!isSameDate() || !sameTimeZone()) return noConnection();

    return (_currentTime.weekday == 7)
        ? Closed()
        : (_currentTime.hour < times['start'] ||
                _currentTime.hour >= times['end'])
            ? NotYet()
            : Scaffold(
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
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: [
                              Hero(
                                tag: 'murad',
                                child: Image(
                                  image: AssetImage('Images/Murad.png'),
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
                                  getTime(),
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
                            child: MyForm(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }
}
