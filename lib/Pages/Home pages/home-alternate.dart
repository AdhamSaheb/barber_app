import 'package:flutter/material.dart';
import 'package:sample_app/BookingBloc/bloc/booking_bloc.dart';
import 'package:sample_app/Pages/Booking.dart';
import 'package:sample_app/Pages/ReservationStatus/ReservationStatusUI.dart';
import 'package:sample_app/Pages/ReservationStatus/bloc/reservationstatus_bloc.dart';
import 'package:sample_app/SecondChairPages/Booking2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAlternate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void _showDialog() {
      showAboutDialog(
          context: context,
          applicationName: 'Mustache Barbershop',
          applicationIcon:
              Image.asset('Images/ic_launcher.png', width: 90, height: 100),
          applicationVersion: '2.0',
          children: [
            Text('Developer : Adham Saheb'),
          ]);
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: screenHeight / 15,
            ),
            //location and information buttons

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Hero(
                  tag: 'barber',
                  child: Image(
                    image: AssetImage(
                      'Images/barber.png',
                    ),
                    height: 200,
                    width: 100,
                  ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth / 25,
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(color: Colors.white, width: 0.5),
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  onTap: () => _showDialog(),
                ),
              ],
            ),
            //the 4 buttons
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                      elevation: 5.0,
                      color: Colors.blue,
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Hero(
                            tag: 'murad',
                            child: Image(
                              image: AssetImage('Images/Murad.png'),
                              height: 70,
                              width: 50,
                            ),
                          ),
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
                              ),
                            ],
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => BookingBloc(),
                                    child: Booking(
                                      isBarber: false,
                                    ),
                                  )),
                        );
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                      elevation: 5.0,
                      color: Colors.white,
                      padding: EdgeInsets.all(15),
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
                          Hero(
                            tag: 'eddy',
                            child: Image(
                              image: AssetImage('Images/eddy.png'),
                              height: 70,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => BookingBloc(),
                                    child: Booking2(
                                      isBarber: false,
                                    ),
                                  )),
                        );
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                      elevation: 5.0,
                      color: Colors.red,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Check Reservation Status',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Check Status of Your Most Recent Reservations',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'ChelseaMarket'),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.calendar_today,
                            size: 50,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) =>
                                        ReservationstatusBloc(),
                                    child: ReservationStatus(),
                                  )),
                        );
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                      elevation: 5.0,
                      color: Color(0xff6AF4FF),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Navigate to Barbershop',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Navigate to barbershop through maps',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontFamily: 'ChelseaMarket'),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.location_on,
                            size: 50,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        openMap(31.831406, 35.231274);
                      }),
                  SizedBox(
                    height: 10,
                  ),
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //redirecting to maps function
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
