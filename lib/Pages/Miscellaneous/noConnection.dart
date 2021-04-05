import 'package:flutter/material.dart';

class noConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
          ),
        ),
        body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'No Connection!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster'),
                ),
                SizedBox(
                  height: 50,
                ),
                Icon(Icons.signal_wifi_off, color: Colors.red[400], size: 100),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Looks like your phone is not connected to the Internet, try connecting to a network and set your device\'s Time to Automatic ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ]),
        ));
  }
}
