import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:sample_app/Intro/IntroScreen.dart';
import 'package:sample_app/Pages/Miscellaneous/Loading.dart';
import 'package:sample_app/Pages/Miscellaneous/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> with AfterLayoutMixin<Initial> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Wrapper()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();
  @override
  Widget build(BuildContext context) {
    return Loading();
  }
}
