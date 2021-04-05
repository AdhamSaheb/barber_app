import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_app/BookingBloc/bloc/booking_bloc.dart';
import 'package:sample_app/Pages/Barbershop%20State/Closed.dart';
import 'package:sample_app/Pages/Barbershop%20State/Notyet.dart';
import 'package:sample_app/Pages/Miscellaneous/Loading.dart';
import 'package:sample_app/Pages/Miscellaneous/noConnection.dart';
import 'package:sample_app/Pages/MyForm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Booking extends StatefulWidget {
  //this will be passed to the widget, if true , means barber has navigated here and will bypass all conditions in build
  @required
  final bool isBarber;
  Booking({this.isBarber});
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state is BookingInitial) {
          BlocProvider.of<BookingBloc>(context)
              .add(FetchData(barberName: 'Murad', isBarber: widget.isBarber));
        }
        if (state is BookingLoading) return Loading();
        if (state is BookingClosed) return Closed();
        if (state is BookingNotYet) return NotYet();
        if (state is BookingLoaded)
          return MainBody(
            now: state.now,
          );
        return noConnection();
      },
    );
  }
}

class MainBody extends StatelessWidget {
  final DateTime now;
  MainBody({this.now});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Hero(
                      tag: 'murad',
                      child: Image(
                        image: AssetImage('Images/Murad.png'),
                        height: 100,
                        width: 90,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black87),
                      // color: Colors.black87,
                      // width: double.infinity,
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        DateFormat('EEEE yyyy-MM-dd – HH:mm').format(now),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'ChelseaMarket',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ), //this is where the black box ends

                SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: MyForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
