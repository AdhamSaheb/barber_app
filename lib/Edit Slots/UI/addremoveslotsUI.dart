import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/Edit%20Slots/bloc/addremoveslots_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/Pages/Miscellaneous/Loading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddRemoveSlotsUI extends StatefulWidget {
  //selected barber from drop down button, used in dialoug
  String barber;
  //selected time in dialog
  String time;
  @override
  _AddRemoveSlotsUIState createState() => _AddRemoveSlotsUIState();
}

class _AddRemoveSlotsUIState extends State<AddRemoveSlotsUI> {
  @override
  Widget build(BuildContext context) {
    const Color myColor = Color(0xff6AF4FF);
    //selected barber from drop down button, used both in ui and dialoug
    String barber;

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        FlatButton(child: Text("OK"), onPressed: () {}),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Slots'),
        backgroundColor: myColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 10, 5),
          child: Column(
            // main body of page
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //first title
              Text(
                'Select Barber',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              //select barber button
              DropdownButtonFormField<String>(
                dropdownColor: Colors.white,
                validator: (value) {
                  print(value);
                  if (value == null) return null;
                },
                isExpanded: true,
                decoration: inputdecorationDropButton(),
                items: [
                  DropdownMenuItem<String>(
                    child: Container(child: Text('Murad')),
                    value: 'Murad',
                  ),
                  DropdownMenuItem<String>(
                    child: Container(child: Text('Eddy')),
                    value: 'Eddy',
                  ),
                ],
                onChanged: (String value) {
                  setState(() {
                    print(value);
                    barber = value;
                    //send event to bloc to load values
                    BlocProvider.of<AddremoveslotsBloc>(context)
                        .add(SelectBarber(value));
                  });
                },
                hint: Text(
                  'Select Barber',
                ),
                value: barber,
              ),
              SizedBox(height: 15),
              //second title in row with a button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Slots',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  //button to show dialog to add slots
                  GestureDetector(
                    //onTap: showDialog(),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.black, width: 0.2),
                        color: myColor,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    onTap: () => _showCupertinoDialog(),
                  ),
                ],
              ),

              //this is where bloc builder starts
              BlocBuilder<AddremoveslotsBloc, AddremoveslotsState>(
                  builder: (context, state) {
                if (state is AddremoveslotsInitial)
                  return Center(
                    child: Text(
                      'Please Select a barber first',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    heightFactor: 5,
                  );
                //loading state
                if (state is LoadingState) return Loading();
                // if barber selected
                if (state is BarberSelected)
                  return ListView.builder(
                      itemCount: state.times.length,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Slidable(
                              actionPane: SlidableBehindActionPane(),
                              actionExtentRatio: 0.2,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: myColor,
                                  //borderRadius:
                                  // BorderRadius.all(Radius.circular(20))
                                ),
                                //margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(30),
                                child: Text(
                                  state.times[index],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              actions: [
                                IconSlideAction(
                                    closeOnTap: true,
                                    color: Colors.red,
                                    icon: Icons.delete,
                                    onTap: () => {
                                          BlocProvider.of<AddremoveslotsBloc>(
                                                  context)
                                              .add(RemoveSlot(
                                                  barber:
                                                      state.barber.toString(),
                                                  time: state.times[index])),
                                          print(state.barber.toString() +
                                              "-" +
                                              state.times[index])
                                        }),
                              ],
                            ),
                          ),
                        );
                      });
              })
            ],
          ),
        ),
      ),
    );
  }

  List<String> _times = [
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Add Slot',
                  textAlign: TextAlign.center,
                ),
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select a Slot and a Barber',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // 2 drop down buttons one for barber and another for time
                  DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    validator: (value) {
                      print(value);
                      if (value == null) return null;
                    },
                    isExpanded: true,
                    decoration: inputdecorationDropButton(),
                    items: [
                      DropdownMenuItem<String>(
                        child: Container(child: Text('Murad')),
                        value: 'Murad',
                      ),
                      DropdownMenuItem<String>(
                        child: Container(child: Text('Eddy')),
                        value: 'Eddy',
                      ),
                    ],
                    onChanged: (String value) {
                      setState(() {
                        print(value);
                        widget.barber = value;
                        //send event to bloc to load values
                        // BlocProvider.of<AddremoveslotsBloc>(context)
                        //     .add(SelectBarber(value));
                      });
                    },
                    hint: Text(
                      'Select Barber',
                    ),
                    value: widget.barber,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    validator: (value) {
                      print(value);
                      if (value == null) return null;
                    },
                    isExpanded: true,
                    decoration: inputdecorationDropButton(),
                    items: _times.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        print(value);
                        widget.time = value;
                        //send event to bloc to load values
                        // BlocProvider.of<AddremoveslotsBloc>(context)
                        //     .add(SelectBarber(value));
                      });
                    },
                    hint: Text(
                      'Select Time',
                    ),
                    value: widget.time,
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Confirm'),
                  onPressed: () {
                    //send event to bloc
                    BlocProvider.of<AddremoveslotsBloc>(context)
                        .add(AddSlot(time: widget.time, barber: widget.barber));
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}

// constant decoration for the drop down button
InputDecoration inputdecorationDropButton() {
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,

    //errorStyle: TextStyle(fontSize: 0),
    alignLabelWithHint: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(color: Colors.black, width: 0.7),
      //borderRadius: BorderRadius.circular(100),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(color: Colors.blue, width: 1.3),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(color: Colors.red, width: 1.3),
    ),
    contentPadding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(color: Colors.red, width: 1.5),
    ),
  );
}
