import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/Pages/Closed.dart';
import 'package:sample_app/Pages/Loading.dart';
import 'package:sample_app/Pages/Notyet.dart';
import 'package:sample_app/SecondChairPages/MyForm2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String getTime() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE yyyy-MM-dd – kk:mm').format(now);
  return formattedDate;
}

class Booking2 extends StatefulWidget {
  @override
  _Booking2State createState() => _Booking2State();
}

class _Booking2State extends State<Booking2> {
  dynamic times;

  Future<dynamic> getTimes() async {
    final DocumentReference document =
        Firestore.instance.collection("Times").document('times');

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        times = snapshot.data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getTimes();
  }

  @override
  Widget build(BuildContext context) {
    if (times == null) return Loading();
    if (times['closed'] == true) return Closed();

    return (DateTime.now().weekday == 7)
        ? Closed()
        : (DateTime.now().hour < times['start'] ||
                DateTime.now().hour >= times['end'])
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
                body: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black87),
                          // color: Colors.black87,
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            getTime(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'ChelseaMarket',
                              fontSize: 20,
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
