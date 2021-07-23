import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winzee/login/signup.dart';

import '../home/body.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                "Welcome back",
                                style: TextStyle(
                                    fontFamily: "PlayFairDisplay",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange[200],
                                    fontSize: 40.0),
                              ),
                              Text(
                                "Let's Play Again",
                                style: TextStyle(
                                    fontFamily: "BalooTamma2",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange[200],
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
                          child: Icon(
                            Icons.sports_baseball,
                            size: 140.0,
                            color: Colors.deepOrange[200],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(

                    padding:
                    const EdgeInsets.only(top:35.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(

                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          )
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 35.0, right: 35.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Phone No.",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 35.0, right: 35.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "PassWord",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            obscureText: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 80.0, right: 80.0,),
                            child: ActionChip(
                              label: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'BalooTamma2'),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.deepOrange[200],
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Body(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:48.0),
                  child: Column(
                    children: <Widget>[
                      Text("Dont have an acoount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
                      ActionChip(
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.red,
                                  fontFamily: 'BalooTamma2',),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.white,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
