import 'package:flutter/material.dart';

class Service{

  String image;
  String name; 

  Service({this.name,this.image});

}

Widget serviceBuilder(Service service) {
return Padding(
  padding: const EdgeInsets.fromLTRB(5,5,5,5),
    child:  
            Card(
              
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(
                    image : NetworkImage('${service.image}'),
                    width: 100,
                    height: 100,
                    
  
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 20, 
                    endIndent: 20,
                    thickness: 2,
                  ),
                  Text (
                    '${service.name}',
                    style: TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 20
                    ),
  
                  )
                ],

            )
          
  
  ),
);

}