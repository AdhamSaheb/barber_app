import 'package:flutter/material.dart';
import 'package:sample_app/Models/Service.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  List<Service> services = [
    //  Service(name: 'Haircuts',image :'https://img.icons8.com/plasticine/2x/scissors.png'),
    //  Service(name: 'Beard Trimming', image: 'https://www.seekpng.com/png/detail/775-7757072_man-vector-illustration-male-icon-vectors-face-black.png'),
    //  Service(name:'Face Wax', image: 'https://image.flaticon.com/icons/png/512/1005/1005787.png'),
    //  Service(name:'Kids\' Haricuts' ,image:'https://www.pngkey.com/png/detail/448-4486205_man-getting-haircut-emoji-icon-corte-de-cabelo.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          'About Us',
          style: TextStyle(
            fontFamily: 'ChelseaMarket',
            color: Colors.black,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(

                //color: Colors.black,
                width: double.infinity,
                height: 300,
                child: Image(
                    // image: NetworkImage('https://scontent.ftlv6-1.fna.fbcdn.net/v/t1.0-9/62380154_1621256894675821_9071208647001899008_n.jpg?_nc_cat=103&_nc_sid=8bfeb9&_nc_ohc=K-RVJEPsnlAAX_793Q3&_nc_ht=scontent.ftlv6-1.fna&oh=f30e8faddfbb2f119cbff7ee3bb24ee1&oe=5EECE9C5'),

                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Mustache',
                  style: TextStyle(
                      fontFamily: 'ChelseaMarket',
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Text(
                  'Barbershop',
                  style: TextStyle(
                      color: Colors.red[900],
                      fontFamily: 'IndieFlower',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 30),

            Text(
              'Barber',
              style: TextStyle(fontSize: 30, fontFamily: 'IndieFlower'),
            ),

            Text(
              'Murad Mansour',
              style: TextStyle(
                  fontFamily: 'ChelseaMarket',
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            SizedBox(height: 20),
            // Image(
            //   ""//image: NetworkImage('https://scontent.ftlv6-1.fna.fbcdn.net/v/t1.0-9/53245261_1544693338998844_5001911907829940224_n.jpg?_nc_cat=110&_nc_sid=8bfeb9&_nc_ohc=nl7UedgSJqoAX9yiqNZ&_nc_ht=scontent.ftlv6-1.fna&oh=609559bab43ddbdcb30a4a0794ebc0e1&oe=5EECCD77'),
            // ),
            SizedBox(height: 20),
            Text('Services',
                style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 30,
                )),
            Container(
              height: 400,
              child: GridView.count(
                  primary: false,
                  crossAxisCount: 2,
                  children: services.map((e) => serviceBuilder(e)).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
