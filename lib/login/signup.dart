import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winzee/authServices.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String phoneno = "", verificationId = "",smsCode="";
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomPadding: false,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 30, left: 8, right: 8),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Welcome to Winzee",
                            style: TextStyle(
                                fontFamily: "PlayFairDisplay",
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange[200],
                                fontSize: 40.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 8, bottom: 30, right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            // color: Colors.deepOrange[200],
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          )
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 35, left: 35, right: 35.0),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Phone No.",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (val) {
                              setState(() {
                                this.phoneno = val;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 17, bottom: 17, left: 35, right: 35.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Name",
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
                            padding:
                                const EdgeInsets.only(left: 80.0, right: 80.0),
                            child: ActionChip(
                              label: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'BalooTamma2'),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.deepOrange[200],
                              onPressed: () {
                                verifyPhone(phoneno);
                                codeSent ?  showAlertDialog(
                                ) :Container();
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Body(),
                                //   ),
                                // );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Already have an account",
                    style: TextStyle(
                        fontFamily: "BalooTamma2",
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0),
                  ),
                ),
                ActionChip(
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'BalooTamma2',
                            color: Colors.deepOrange[200]),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  showAlertDialog() {

    // set up the button
    Widget okButton = TextButton(
      child: Text("Submit"),
      onPressed: () { },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("OTP"),
      content:  Column(
        children: [
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Enter OTP",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            onChanged: (val) {
              setState(() {
                this.smsCode = val;
              });
            },
          ),
          TextButton(onPressed: (){
            AuthService().signInWithOTP(smsCode, verificationId);
          } , child: Text("Submit"),),
        ],
      ),


    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> verifyPhone(phoneno) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print("${authException.message}");
    };

    final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
      this.verificationId = verId;

      this.codeSent = true;
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneno,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
