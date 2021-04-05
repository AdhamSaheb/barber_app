import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/Confirm_Pages/Confirm.dart';
import 'package:sample_app/Confirm_Pages/Confirm2.dart';
import 'package:sample_app/Intro/IntroScreen.dart';
import 'package:sample_app/Models/user.dart';
import 'package:sample_app/Pages/Choice.dart';
import 'package:sample_app/Pages/Barbershop%20State/Closed.dart';
import 'package:sample_app/Pages/Home%20pages/HomeAdmin.dart';
import 'package:sample_app/Pages/Login/LoginPage.dart';
import 'package:sample_app/Pages/Barbershop%20State/Notyet.dart';
import 'package:sample_app/Pages/Home%20pages/home-alternate.dart';
import 'package:sample_app/Pages/Miscellaneous/initial.dart';
import 'package:sample_app/Pages/Miscellaneous/noConnection.dart';
import 'package:sample_app/Pages/Miscellaneous/wrapper.dart';
import 'package:sample_app/SecondChairPages/Booking2.dart';
import 'package:sample_app/SecondChairPages/Query2.dart';
import 'package:sample_app/Services/authentication.dart';
import 'Pages/Miscellaneous/Loading.dart';
import 'Pages/Booking.dart';
import 'dart:io' show Platform;
import 'package:in_app_update/in_app_update.dart';
import 'Pages/Query.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //since in app update only works on android
    if (Platform.isAndroid) {
      checkForUpdate();
    }
  }

  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/initial',
        routes: {
          '/login': (context) => LoginPage(),
          '/wrapper': (context) => Wrapper(),
          '/homeAlternate': (context) => HomeAlternate(),
          '/homeAdmin': (context) => HomeAdmin(),
          '/booking': (context) => Booking(),
          '/booking2': (context) => Booking2(),
          '/loading': (context) => Loading(),
          '/Query': (context) => Query(),
          '/Query2': (context) => Query2(),
          '/choice': (context) => Choice(),
          '/confirm': (context) => Confirm(),
          '/confirm2': (context) => Confirm2(),
          '/intro': (context) => IntroScreen(),
          '/initial': (context) => Initial(),
          '/closed': (context) => Closed(),
          '/notyet': (context) => NotYet(),
          '/noConnection': (context) => noConnection(),
        },
      ),
    );
  }
}

// Platform messages are asynchronous, so we initialize in an async method.
Future<void> checkForUpdate() async {
  InAppUpdate.checkForUpdate().then((info) {
    if (info.updateAvailable) {
      InAppUpdate.performImmediateUpdate();
    } else {
      print('no updates available');
    }
  }).catchError((e) {
    print("in app update error : " + e.toString());
  });
}
