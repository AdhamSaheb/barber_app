import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/Components/SlotTile.dart';
import 'package:sample_app/Components/Taken.dart';
import 'package:sample_app/Components/Pending.dart';
import 'package:sample_app/Pages/Barbershop%20State/Full.dart';
import 'package:sample_app/Pages/Miscellaneous/Loading.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:sample_app/Services/Database.dart';
import 'package:connectivity/connectivity.dart';

class SlotList extends StatefulWidget {
  @override
  _SlotListState createState() => _SlotListState();
}

List<bool> choices = List.filled(18, false);
String phone = "";
String name = "";
String time = "";
final nameController = new TextEditingController();
final phoneController = new TextEditingController();
StreamSubscription subscription;

class _SlotListState extends State<SlotList> {
  @override
  void initState() {
    super.initState();
    nameController.clear();
    phoneController.clear();
    //subscribe to connection change
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none)
        Navigator.pushReplacementNamed(context, '/noConnection');
    });
  }

  // Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  Future isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        (connectivityResult == ConnectivityResult.wifi)) {
      // I am connected to a mobile network or wifi
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      // I am not connected
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final slots = Provider.of<List<Slot>>(context);
    isConnected().then((value) => {
          if (value == false)
            Navigator.pushReplacementNamed(context, '/noConnection')
        });

    // this will show the dialoug after reservation
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WAIT FOR APPROVAL !'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  //Text('Reservation Successful !'),
                  Text("We will send you an SMS if your reservation at " +
                      time +
                      " is confirmed !"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('Continue'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/initial');
                  }),
            ],
          );
        },
      );
    }

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
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.person),
                          Container(
                            width: 250,
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: nameController,
                              decoration: const InputDecoration(
                                hintText: 'What\'s your name ?',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(Icons.phone),
                          Container(
                            width: 250,
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'What\'s your mobile number ? ',
                              ),
                              validator: (value) {
                                if (!isNumeric(value) || value.isEmpty)
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.timer),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Available Slots',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )
                        ],
                      ),
                      Divider(
                        indent: 50,
                        endIndent: 50,
                        color: Colors.black,
                        thickness: 1.5,
                      ),
                      Expanded(
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          primary: false,
                          padding: EdgeInsets.all(12),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1.3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: slots.length,
                          itemBuilder: (context, index) {
                            return (slots[index].isReserved() == true)
                                ? Taken()
                                : (slots[index].isPending() == true)
                                    ? Pending()
                                    : GestureDetector(
                                        onTap: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            DatabaseService().updatedata(
                                                nameController.text,
                                                phoneController.text,
                                                slots[index].time);
                                            _showMyDialog();
                                            _formKey.currentState.reset();
                                          }
                                        },
                                        child: SlotTile(
                                          slot: slots[index],
                                        ),
                                      );
                          },
                        ),
                      ),
                    ]),
              );
  }
}

/* ------------------------------------------------------ */
//this is to check if the phone is actually a number
bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null;
}
