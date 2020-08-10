import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

//use stless to generate
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  //padding: EdgeInsets.all(15),
                  child: Text(
                    'Barbers Menu',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Anton', fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      //color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage('Images/menu-background.jpg'),
                          fit: BoxFit.fill)),
                ),
                ListTile(
                  leading: Icon(Icons.input),
                  title: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Anton', fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
          ),

          // appBar: AppBar(

          //   centerTitle: true,
          //   backgroundColor: Colors.white,
          //   elevation: 0,

          //   title: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[

          //       Image(
          //         image: NetworkImage('https://i.pinimg.com/originals/41/ac/e4/41ace4e829af57780f9597e6a8e28cb4.gif'),
          //         width: 50,
          //         height: 150,
          //       ),
          //       Text(
          //         'Mustache Barbershop',
          //         style: TextStyle(
          //           letterSpacing: 2.0,
          //           color: Colors.black,
          //           fontFamily: 'ChelseaMarket',
          //           fontSize: 23
          //         ),
          //       )
          //     ],
          //   ),
          //   //elevation: 0.0,
          // ),
          body: Stack(
            children: <Widget>[
              Image(
                image: AssetImage('Images/home.jpg'),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(35, 5, 35, 50),
                //margin: EdgeInsets.fromLTRB(0,200,0,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image(
                      image: AssetImage('Images/logo.png'),
                      width: 300,
                      height: 250,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton.icon(
                      icon: Icon(
                        Icons.content_cut,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.white)),
                      //padding: EdgeInsets.all(5),
                      onPressed: () {
                        Navigator.pushNamed(context, '/choice');
                      },
                      color: Colors.black,
                      label: Text(
                        'Book ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Anton'),
                      ),
                    ),
                    SizedBox(height: 15),
                    RaisedButton.icon(
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.white)),
                      //padding: EdgeInsets.all(5),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Query');
                      },
                      color: Colors.black,
                      label: Text(
                        'Send SMS ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Anton'),
                      ),
                    ),
                    SizedBox(height: 15),
                    RaisedButton.icon(
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Query2');
                      },
                      color: Colors.black,
                      label: Text(
                        'Eddy\'s Scedule',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Anton'),
                      ),
                    ),
                    SizedBox(height: 45),
                  ],
                ),
              )
            ],
          ),
          floatingActionButton: SpeedDial(
            //animationSpeed: 1,
            curve: Curves.easeInOut,
            backgroundColor: Colors.black,
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 25.0, color: Colors.white),
            children: [
              SpeedDialChild(
                child: Icon(Icons.info_outline, color: Colors.white),
                backgroundColor: Colors.black,
                onTap: () => Navigator.pushNamed(context, '/about'),
                label: 'About Us',
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                labelBackgroundColor: Colors.black,
              ),

              // SpeedDialChild(
              //   child: Icon(Icons.accessibility, color: Colors.white),
              //   backgroundColor: Colors.black,
              //   onTap: () => Navigator.pushNamed(context, '/confirm2'),
              //   label: 'Eddy',
              //   labelStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),
              //   labelBackgroundColor: Colors.black,
              // ),
              // SpeedDialChild(
              //   child: Icon(Icons.accessibility, color: Colors.white),
              //   backgroundColor: Colors.black,
              //   onTap: () => Navigator.pushNamed(context, '/confirm'),
              //   label: 'Murad',
              //   labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              //   labelBackgroundColor: Colors.black,
              // ),
            ],
          )),
    );
  }
}
