import 'package:flutter/material.dart';
import 'package:sample_app/Models/Slot.dart';
import 'package:sample_app/Pages/Miscellaneous/Loading.dart';
import 'package:sample_app/Pages/Miscellaneous/noConnection.dart';
import 'package:sample_app/Pages/ReservationStatus/bloc/reservationstatus_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReservationStatus extends StatefulWidget {
  @override
  _ReservationStatusState createState() => _ReservationStatusState();
}

class _ReservationStatusState extends State<ReservationStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text('Reservation Status',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<ReservationstatusBloc, ReservationstatusState>(
            builder: (context, state) {
              if (state is ReservationstatusInitial) {
                BlocProvider.of<ReservationstatusBloc>(context)
                    .add(FetchReservations());
              }
              if (state is ReservationstatusFailed) return noConnection();
              if (state is ReservationstatusEmpty) return noReservations();
              if (state is ReservationstatusLoaded)
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.reservations.length,
                        itemBuilder: (context, index) =>
                            reservationCard(state.reservations[index]),
                      ),
                    )
                  ],
                );
              return Loading();
            },
          )),
    );
  }
}

// Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [],
//         ),

Widget noReservations() {
  return Center(
    heightFactor: 1.5,
    child: Text(
      'There are no Reservations for you at the moment',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget reservationCard(Slot slot) {
  bool isPending = slot.isPending();
  //bool isTaken = slot.reservationTime.toDate().day == DateTime.now().day;

  return Card(
    color: Colors.white,
    elevation: 2,
    shadowColor: (isPending) ? Colors.orange : Colors.green,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(Icons.person),
            SizedBox(
              width: 5,
            ),
            Text(
              slot.name,
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ]),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.calendar_today),
              SizedBox(
                width: 5,
              ),
              Text(
                DateFormat('EEEE yyyy-MM-dd')
                    .format(slot.reservationTime.toDate()),
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.timelapse),
              SizedBox(
                width: 5,
              ),
              Text(
                slot.time,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (isPending)
                    ? "Waiting Approval -  ينتظر الموافقة "
                    : "Accepted - موافق عليه",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: (isPending) ? Colors.orange : Colors.green),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
