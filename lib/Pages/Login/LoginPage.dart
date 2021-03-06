import 'package:flutter/material.dart';
import 'package:sample_app/Pages/Miscellaneous/Loading.dart';
import 'package:sample_app/Services/authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 1.0,
              title: Text('Sign in'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
                  child: Hero(
                    tag: 'barber',
                    child: Image(
                      width: 200,
                      height: 250,
                      image: AssetImage('Images/barber2.png'),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Enter your email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          obscureText: true,
                          decoration:
                              InputDecoration(labelText: 'Enter your password'),
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          width: 500,
                          height: 50,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white)),
                              color: Colors.black,
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);

                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error =
                                          'Could not sign in with those credentials';
                                    });
                                  } else
                                    Navigator.pushReplacementNamed(
                                        context, '/wrapper');
                                }
                              }),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
  }
}
