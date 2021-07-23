import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winzee/final_Payment.dart';

class Betting extends StatefulWidget {
  String team;

  Betting({required this.team});

  @override
  _BettingState createState() => _BettingState();
}

class _BettingState extends State<Betting> {
  double indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${widget.team}",
              style: TextStyle(
                  color: Colors.deepOrange[200],
                  fontSize: MediaQuery.of(context).size.width / 12,
                  fontFamily: "BalooTamma2",
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30.0),
              child: Divider(
                height: 20,
                thickness: 6, color: Colors.blue[100],
              ),
            ),
            const SizedBox(height: 38),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 8,
                      backgroundColor: Colors.blue[100],
                      child: ChoiceChip(
                        backgroundColor: Colors.blue[100],
                        label: Text(
                          "10",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "BalooTamma2",
                          ),
                        ),
                        selected: indexSelected == 10,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 10 : -1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment(amount : indexSelected),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 8,
                      backgroundColor: Colors.blue[100],
                      child: ChoiceChip(
                        backgroundColor: Colors.blue[100],
                        label: Text(
                          "20",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "BalooTamma2",
                          ),
                        ),
                        selected: indexSelected == 20,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 20 : -1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment(amount : indexSelected),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 8,
                      backgroundColor: Colors.blue[100],
                      child: ChoiceChip(
                        backgroundColor: Colors.blue[100],
                        label: Text(
                          "50",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "BalooTamma2",
                          ),
                        ),
                        selected: indexSelected == 50,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 50 : -1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment(amount : indexSelected),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 8,
                      backgroundColor: Colors.blue[100],
                      child: ChoiceChip(
                        backgroundColor: Colors.blue[100],
                        label: Text(
                          "100",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "BalooTamma2",
                          ),
                        ),
                        selected: indexSelected == 100,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 100 : -1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment(amount : indexSelected),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 8,
                      backgroundColor: Colors.blue[100],
                      child: ChoiceChip(
                        backgroundColor: Colors.blue[100],
                        label: Text(
                          "200",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "BalooTamma2",
                          ),
                        ),
                        selected: indexSelected == 200,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 200 : -1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment(amount : indexSelected),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 8,
                      backgroundColor: Colors.blue[100],
                      child: ChoiceChip(
                        backgroundColor: Colors.blue[100],
                        label: Text(
                          "500",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "BalooTamma2",
                          ),
                        ),
                        selected: indexSelected == 500,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 500 : -1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment(amount : indexSelected),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 8,
                      backgroundColor: Colors.blue[100],
                      child: ChoiceChip(
                        backgroundColor: Colors.blue[100],
                        label: Text(
                          "1000",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "BalooTamma2",
                          ),
                        ),
                        selected: indexSelected == 1000,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 1000 : -1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment(amount : indexSelected),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 8,
                      backgroundColor: Colors.blue[100],
                      child: ChoiceChip(
                        backgroundColor: Colors.blue[100],
                        label: Text(
                          "2000",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "BalooTamma2",
                          ),
                        ),
                        selected: indexSelected == 2000,
                        onSelected: (value) {
                          setState(() {
                            indexSelected = value ? 2000 : -1;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Payment(amount : indexSelected),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
