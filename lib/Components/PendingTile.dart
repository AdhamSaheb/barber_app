import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'package:sample_app/Models/Slot.dart';
import 'package:sample_app/Services/Database.dart';

class PendingTileBuilder extends StatefulWidget {
  @override
  final Slot slot;
  final String collection;
  PendingTileBuilder({this.slot, this.collection});

  @override
  _PendingTileBuilderState createState() => _PendingTileBuilderState();
}

class _PendingTileBuilderState extends State<PendingTileBuilder> {
  String _message;
  String confirmationMsg =
      'You\'re reservation at Mustache Barbershop has been approved ';
  String declinedMsg =
      'You\'re reservation has been declined, please try another time , were sorry ';

  void _sendSMS(String message, List<String> recipents) async {
    String _result =
        await FlutterSms.sendSMS(message: message, recipients: recipents);
    setState(() => _message = _result);
  }

  Widget build(BuildContext context) {
    return (widget.slot.isPending() == false)
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1)),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  width: 50,
                  height: 180,
                  color: Colors.grey[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        widget.slot.time,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontFamily: 'Anton'),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.slot.name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            Text(
                              widget.slot.phone,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ButtonTheme(
                              minWidth: 50.0,
                              height: 50.0,
                              child: RaisedButton(
                                elevation: 10,
                                color: Colors.green[500],
                                onPressed: () {
                                  DatabaseService().confirmReservation(
                                      this.widget.collection,
                                      widget.slot.name,
                                      widget.slot.phone,
                                      widget.slot.time);
                                  var recipient = new List<String>();
                                  recipient.add(widget.slot.phone);
                                  _sendSMS(confirmationMsg, recipient);
                                },
                                child: Text("Confirm",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 50.0,
                              height: 50.0,
                              child: RaisedButton(
                                elevation: 10,
                                color: Colors.red[600],
                                onPressed: () {
                                  DatabaseService().declineReservation(
                                      this.widget.collection, widget.slot.time);
                                  var recipient = new List<String>();
                                  recipient.add(widget.slot.phone);
                                  _sendSMS(declinedMsg, recipient);
                                },
                                child: Text(
                                  "Decline",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                )),
          );
  }
}