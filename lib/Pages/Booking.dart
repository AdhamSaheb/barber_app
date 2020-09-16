import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/Pages/Closed.dart';
import 'package:sample_app/Pages/Loading.dart';
import 'package:sample_app/Pages/MyForm.dart';
import 'package:sample_app/Pages/Notyet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String getTime() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE yyyy-MM-dd – kk:mm').format(now);
  return formattedDate;
}

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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
