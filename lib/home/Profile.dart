import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0),
          child: ListView(
            children: <Widget>[
              Container(
                height: 200.0,
                child: new UserAccountsDrawerHeader(
                  accountName: Text(
                    "Himanshu",
                    style: TextStyle(
                        color: Colors.black,letterSpacing: 0.9,
                        fontSize: 25.0,
                        fontFamily: "BalooTama2"),
                  ),
                  accountEmail: Text(
                    "8209178393",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontFamily: "BalooTamma2"),
                  ),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.deepOrange[200],
                      child: Icon(Icons.person_outline),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrange[50],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: ListTile(
                        title: Text("Details"),
                        leading: CircleAvatar(
                            backgroundColor: Colors.deepOrange[200],
                            child: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: ListTile(
                        title: Text("About Us"),
                        leading: CircleAvatar(
                            backgroundColor: Colors.deepOrange[200],
                            child: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: ListTile(
                        title: Text("Share"),
                        leading: CircleAvatar(
                            backgroundColor: Colors.deepOrange[200],
                            child: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: ListTile(
                        onTap: showAlertDialog(context),
                        title: Text("Log out"),
                        leading: CircleAvatar(
                            backgroundColor: Colors.deepOrange[200],
                            child: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


showAlertDialog( BuildContext context) {

  // set up the button
  // Widget okButton = FlatButton(
  //   child: Text("Submit"),
  //   onPressed: () {
  //     AuthService().signOut();
  //   },
  // );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Do YOu want to Log out"),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
