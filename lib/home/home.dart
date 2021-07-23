import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:winzee/pages/betting.dart';

class Todo {
  final String team1;
  final String team2;

  Todo(this.team1, this.team2);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data;
  List userData = [];
  late final match;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://cricapi.com/api/matches/aoWLkz13HsXKK5osoQs9WIB3n113"));
    data = json.decode(response.body);
    setState(() {
      userData = data["matches"];
    });
  }

  var tempDate = 0;
  String teamChooser = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          DateTime today = new DateTime.now();
          String dateSlug =
              "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
          String matchTime = dateSlug + "T00:00:00:000Z";

          if (((userData[index]["date"].toString().compareTo(matchTime)) ==
                  -1) &&
              ((userData[index]["matchStarted"] == false))) {
            return Card(
                borderOnForeground: false,
                margin: EdgeInsets.only(left: 28.0, right: 28.0, top: 20.0),
                child: Container(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255,171,145,0.8),
                            Color.fromRGBO(255,171,145,0.5),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                        boxShadow: [
                          // BoxShadow(
                          //   blurRadius: 10.0,
                          //   offset: Offset(0, 5),
                          // )
                        ]),
                    // decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //     colors: [
                    //       Color.fromRGBO(255, 171, 145, 0.8),
                    //       Color.fromRGBO(255, 171, 145, 0.5),
                    //     ],
                    //     begin: const FractionalOffset(0.0, 0.0),
                    //     end: const FractionalOffset(1.0, 0.0),
                    //     stops: [0.0, 1.0],
                    //     tileMode: TileMode.clamp,
                    //   ),
                    // ),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "${userData[index]["team-1"].toUpperCase()} ",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "BalooTamma2",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "V/S",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "${userData[index]["team-2"].toUpperCase()} ",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "BalooTamma2",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.green[200],
                                child: TextButton(
                                  child: Text(
                                    "Bet",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 400,
                                          color: Colors.white30,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                  "Choose team to Bet",
                                                  style: TextStyle(
                                                    fontSize: 30.0,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.italic,
                                                    fontFamily: "BalooTamma2",
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                ChoiceChip(
                                                  label: Text(
                                                    "${userData[index]["team-1"].toUpperCase()} \n V/S",
                                                    style: TextStyle(
                                                      fontSize: 30.0,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: "BalooTamma2",
                                                    ),
                                                  ),
                                                  selected: indexSelected == 0,
                                                  onSelected: (value) {
                                                    setState(() {
                                                      indexSelected =
                                                          value ? 0 : -1;
                                                      teamChooser =
                                                          "${userData[index]["team-1"].toUpperCase()}";
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Betting(
                                                                  team:
                                                                      teamChooser),
                                                        ),
                                                      );
                                                    });
                                                  },
                                                ),
                                                const SizedBox(height: 8),
                                                ChoiceChip(
                                                  // backgroundColor:
                                                  //     Colors.deepOrange[200],
                                                  label: Text(
                                                    "${userData[index]["team-2"].toUpperCase()} ",
                                                    style: TextStyle(
                                                      fontSize: 30.0,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: "BalooTamma2",
                                                    ),
                                                  ),
                                                  selected: indexSelected == 1,
                                                  onSelected: (value) {
                                                    setState(() {
                                                      indexSelected =
                                                          value ? 1 : -1;
                                                      teamChooser =
                                                          "${userData[index]["team-2"].toUpperCase()}";
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Betting(
                                                                  team:
                                                                      teamChooser),
                                                        ),
                                                      );
                                                    });
                                                  },
                                                ),

                                                // ElevatedButton(
                                                //   child: const Text(
                                                //       'GO'),
                                                //   onPressed: () =>
                                                //
                                                // )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),

                            //if(userData[index]["date"]==)
                          ],
                        )),
                  ),
                ));
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

/*
 InkWell(
              onTap: (){
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Match(),),);
              },
              child: Card(

                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(255,171,145,0.8),
                        Color.fromRGBO(255,171,145,0.5),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "${userData[index]["team-1"].toUpperCase()} ",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: "BalooTamma2",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "V/S",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "${userData[index]["team-2"].toUpperCase()} ",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: "BalooTamma2",
                              ),
                            ),
                          ),

                          //if(userData[index]["date"]==)

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "${userData[index]["date"]} ",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: "BalooTamma2",
                              ),
                            ),
                          ),


                        ],
                      )),
                ),
              ),
            );
 */
