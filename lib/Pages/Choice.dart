import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 150),
                    width: double.infinity,
                    child: Text(
                      'Murad',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 50
                      ),
                      
                    ),
                    color:Colors.black,
                  ),
                  onTap: () => Navigator.pushReplacementNamed(context, '/booking'),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 150),
                    width: double.infinity,
                    child: Text(
                      'Eddy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:Colors.black,
                        fontSize: 50
                      ),
                      
                    ),
                    color:Colors.white,
                  ),
                  onTap: () => Navigator.pushReplacementNamed(context, '/booking2'),
                ),
              )
            
            ],
            
          )
    
    );
    }
}