//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Components/SlotTile.dart';
import 'package:sample_app/Components/Taken.dart';
import 'package:sample_app/Components/Pending.dart';
import 'package:sample_app/Pages/Full.dart';
import 'package:sample_app/Pages/Loading.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:sample_app/Services/Database.dart';

class SlotList2 extends StatefulWidget {
  @override
  _SlotList2State createState() => _SlotList2State();
}

List<bool> choices = List.filled(18, false);
String phone = "";
String name = "";
String time = "";
final nameController = new TextEditingController();
final phoneController = new TextEditingController();

class _SlotList2State extends State<SlotList2> {
  @override
  void initState() {
    super.initState();
    choices = List.filled(18, false);
    nameController.clear();
    phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // this will show the dialoug after reservation
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Reservation Successfull'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  //Text('Reservation Successful !'),
                  Text(
                      "Thank you ! We will send you a message if your reservation at " +
                          time +
                          " is confirmed"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Continue'),
                onPressed: () {
                  // Navigator.popUntil(context, ModalRoute.withName('/home'));
                  // Navigator.pop(context);
                  // Navigator.pop(context);
                  // Navigator.popUntil(context, ModalRoute.withName('/initial'));
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/initial');
                },
              ),
            ],
          );
        },
      );
    }

    // this will show the dialoug after reservation with no time slot selected
    Future<void> _showSelectTimeDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('No time selected '),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  //Text('Reservation Successful !'),
                  Text("Please select a time slot if available !"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        },
      );
    }

    //this is to check if the phone is actually a number
    bool isNumeric(String s) {
      if (s == null) {
        return false;
      }
      return double.parse(s, (e) => null) != null;
    }

    final _formKey = GlobalKey<FormState>();
    final slots = Provider.of<List<Slot>>(context);

    // slots.forEach((slot) {
    //    DatabaseService().init(slot.time);
    //  });

    bool isFull() {
      for (int i = 0; i < slots.length; i++) {
        if (!slots[i].isReserved()) return false;
      }
      return true;
    }

    return (slots == null)
        ? Loading()
        : isFull()
            ? Full()
            : Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.person),
                      Container(
                        width: 250,
                        height: 50,
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'What do people call you?',
                          ),
                          validator: (value) {
                            if (value.isEmpty)
                              return "Please Enter a Valid Name";
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.phone),
                      Container(
                        width: 250,
                        height: 50,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Where can I reach you ? ',
                          ),
                          validator: (value) {
                            if (!isNumeric(value))
                              return "Enter a valid Phone number ";
                            return null;
                          },
                          controller: phoneController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      primary: false,
                      padding: EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: slots.length,
                      itemBuilder: (context, index) {
                        return (slots[index].isReserved() == true)
                            //                           ? Taken()
                            ? Taken()
                            : (slots[index].isPending() == true)
                                ? Pending()
                                : GestureDetector(
                                    onTap: () => setState(() {
                                      choices = List.filled(18, false);
                                      choices[index] = true;
                                      time = slots[index].time;
                                    }),
                                    child: SlotTile(
                                        slot: slots[index],
                                        selected: choices[index]),
                                  );
                      },
                    ),
                  ),
                  RaisedButton(
                    color: Colors.black,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.black)),
                    onPressed: () {
                      if (choices.indexOf(true) != -1) {
                        if (_formKey.currentState.validate()) {
                          DatabaseService().updatedata2(
                              nameController.text, phoneController.text, time);
                          _showMyDialog();
                          _formKey.currentState.reset();
                        }
                      } else {
                        _showSelectTimeDialog();
                      }
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ]),
              );
  }
}
