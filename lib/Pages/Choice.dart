import 'package:flutter/material.dart';
import 'package:sample_app/BookingBloc/bloc/booking_bloc.dart';
import 'package:sample_app/Pages/Booking.dart';
import 'package:sample_app/SecondChairPages/Booking2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[300],
            elevation: 0,
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 4,
                      child: Column(
                        children: [
                          Image.asset('Images/Murad.png'),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Text(
                              'Murad',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      color: Colors.blue[300],
                    ),
                    onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => BookingBloc(),
                                    child: Booking(
                                      isBarber: true,
                                    ),
                                  )),
                        )),
              ),
              Expanded(
                child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Image.asset(
                            'Images/eddy.png',
                            height: MediaQuery.of(context).size.height / 5,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Text(
                              'Eddy',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      color: Colors.white,
                    ),
                    onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => BookingBloc(),
                                    child: Booking2(
                                      isBarber: true,
                                    ),
                                  )),
                        )),
              )
            ],
          )),
    );
  }
}
