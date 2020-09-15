import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/Components/toggle.dart';
import 'package:sample_app/Services/authentication.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//use stless to generate
class HomeAdmin extends StatelessWidget {
  final AuthService _auth = AuthService();

  showPickerNumber(BuildContext context) {
    new Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 5, end: 22),
          NumberPickerColumn(begin: 12, end: 22),
        ]),
        delimiter: [
          PickerDelimiter(
              child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.navigate_next),
          ))
        ],
        hideHeader: true,
        title: new Text("Open > Close"),
        onConfirm: (Picker picker, List value) {
          //start Time
          print(picker.getSelectedValues()[0]);
          //EndTime
          print(picker.getSelectedValues()[1]);
          //change the start and end time in database
          Firestore.instance.collection('Times').document('times').updateData({
            "start": (picker.getSelectedValues()[0]),
            "end": (picker.getSelectedValues()[1])
          });
        }).showDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white10,
              elevation: 0,
              iconTheme: new IconThemeData(color: Colors.black),
            ),
            drawer: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    //padding: EdgeInsets.all(15),
                    child: Text(
                      'Barbers Menu',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Anton',
                          fontSize: 20),
                    ),
                    decoration: BoxDecoration(
                        //color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('Images/menu-background.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Murad',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Anton',
                          fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/confirm');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Eddy',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Anton',
                          fontSize: 20),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/confirm2');
                    },
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.watch_later),
                    title: Text(
                      'Edit Times',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Anton',
                          fontSize: 20),
                    ),
                    onTap: () {
                      // Navigator.pushNamed(context, '/editTimes');
                      showPickerNumber(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.cancel),
                    title: Row(
                      children: [
                        Text(
                          'Closed',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Anton',
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        ClosedToggler(),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings_power),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Anton',
                          fontSize: 20),
                    ),
                    onTap: () async {
                      await _auth.signOut();
                    },
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'HELLO THERE !',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.0),
                            child: Container(
                              height: 2.0,
                              width: 250,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Hope you\'re having a good day',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                      Image(
                        image: AssetImage(
                          'Images/pole.png',
                        ),
                        height: 120,
                        width: 70,
                      ),
                    ],
                  ),
                  RaisedButton(
                      elevation: 5.0,
                      color: Colors.blue,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'TAKE A BREAK',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Roboto'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Schedule an eating break',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'ChelseaMarket'),
                              )
                            ],
                          ),
                          Image(
                            image: AssetImage('Images/food.png'),
                            height: 50,
                            width: 50,
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/choice');
                      }),
                  RaisedButton(
                      elevation: 5.0,
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'MURAD\'S SCHEDULE ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Murad\'s Schedule for today',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontFamily: 'ChelseaMarket'),
                              ),
                            ],
                          ),
                          Image(
                            image: AssetImage('Images/Murad.png'),
                            height: 50,
                            width: 50,
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Query');
                      }),
                  RaisedButton(
                      elevation: 5.0,
                      color: Colors.green[400],
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'EDDY\'S SCHEDULE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Eddy\'s Schedule for today',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'ChelseaMarket'),
                              ),
                            ],
                          ),
                          Image(
                            image: AssetImage('Images/eddy.png'),
                            height: 50,
                            width: 50,
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Query2');
                      }),
                ],
              ),
            )));
  }
}
