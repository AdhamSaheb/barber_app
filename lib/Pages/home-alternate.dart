import 'package:flutter/material.dart';

class HomeAlternate extends StatelessWidget {
  // Color gradientStart = Colors.blue[200]; //Change start gradient color here
  // Color gradientEnd = Colors.grey[100]; //Change end gradient color here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   elevation: 0,
        //   iconTheme: new IconThemeData(color: Colors.black),
        //   centerTitle: true,
        //   title: Image(
        //     image: AssetImage('Images/logo.png'),
        //     width: 50,
        //     height: 50,
        //   ),
        // ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              // Image(
              //   image: AssetImage('Images/logo.png'),
              //   width: 150,
              //   height: 150,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      'Images/barber.png',
                    ),
                    height: 200,
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'HELLO THERE !',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
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
                        'HOW CAN WE HELP YOU ?',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'),
                      ),
                    ],
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
                            'GET A HAIRCUT FROM MURAD',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Roboto'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Reserve a haircut with Murad',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ChelseaMarket'),
                          )
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
                    Navigator.pushNamed(context, '/booking');
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
                            'GET A HAIRCUT FROM EDDY',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Reserve a haircut with Eddy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
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
                    Navigator.pushNamed(context, '/booking2');
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
                            'LOGIN IN AS A BARBER',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sign In to Confirm/Decline bookings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'ChelseaMarket'),
                          ),
                        ],
                      ),
                      Image(
                        image: AssetImage('Images/password.png'),
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  }),
            ],
          ),
        ));
  }
}
