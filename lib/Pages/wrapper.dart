import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Pages/home-alternate.dart';
import 'package:sample_app/Models/user.dart';
import 'package:sample_app/Pages/Home.dart';
import 'package:sample_app/Pages/HomeAdmin.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return HomeAlternate();
    } else {
      return HomeAdmin();
    }
  }
}
