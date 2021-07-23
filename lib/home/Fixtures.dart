import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Fixture extends StatefulWidget {
  @override
  _FixtureState createState() => _FixtureState();
}

class _FixtureState extends State<Fixture> {
  late Map data;
  List userData = [];

  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://cricapi.com/api/matches/aoWLkz13HsXKK5osoQs9WIB3n113"));
    data = json.decode(response.body);
    setState(() {
      userData = data["matches"];
    });
  }


var tempDate= 0;


  @override
  void initState() {
    super.initState();
    getData();

    //DateTime today = new DateTime.now();
    //String dateSlug ="${today.year.toString()}-${today.month.toString().padLeft(2,'0')}-${today.day.toString().padLeft(2,'0')}";
    //String matchTime = dateSlug+"T00:00:00:000Z";

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          if ((userData[index]["matchStarted"] == false)) {
            return InkWell(
              onTap: (){

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
          } else {
            return SizedBox.shrink();

          }
        },
      ),
    );
  }
}
