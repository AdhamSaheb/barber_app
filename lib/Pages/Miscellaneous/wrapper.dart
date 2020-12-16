import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Pages/Home%20pages/home-alternate.dart';
import 'package:sample_app/Models/user.dart';
import 'package:sample_app/Pages/Home%20pages/HomeAdmin.dart';

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
