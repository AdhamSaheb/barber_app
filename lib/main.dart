import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/Confirm_Pages/Confirm.dart';
import 'package:sample_app/Confirm_Pages/Confirm2.dart';
import 'package:sample_app/Models/user.dart';
import 'package:sample_app/Pages/Choice.dart';
import 'package:sample_app/Pages/HomeAdmin.dart';
import 'package:sample_app/Pages/LoginPage.dart';
import 'package:sample_app/Pages/home-alternate.dart';
import 'package:sample_app/Pages/wrapper.dart';
import 'package:sample_app/SecondChairPages/Booking2.dart';
import 'package:sample_app/SecondChairPages/Query2.dart';
import 'package:sample_app/Services/authentication.dart';
import 'Pages/Home.dart';
import 'Pages/Loading.dart';
import 'Pages/Booking.dart';
// import 'Pages/About.dart';
import 'Pages/Query.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        initialRoute: '/wrapper',
        //home: Home(),
        routes: {
          //'/' : (context) => Loading(),
          '/login': (context) => LoginPage(),
          '/wrapper': (context) => Wrapper(),
          '/home': (context) => Home(),
          '/homeAlternate': (context) => HomeAlternate(),
          '/homeAdmin': (context) => HomeAdmin(),
          // '/about': (context) => About(),
          '/booking': (context) => Booking(),
          '/booking2': (context) => Booking2(),
          '/loading': (context) => Loading(),
          '/Query': (context) => Query(),
          '/Query2': (context) => Query2(),
          '/choice': (context) => Choice(),
          '/confirm': (context) => Confirm(),
          '/confirm2': (context) => Confirm2(),
        },
      ),
    );
  }
}
