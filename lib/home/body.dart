import 'package:flutter/material.dart';
import 'Fixtures.dart';
import 'Profile.dart';
import 'wallet.dart';
import 'home.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  int _currentPage = 0;
  final tabs =[
    Home(),
    Fixture(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_balance_wallet,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Wallet(),
                ),
              );
            },
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.sports_cricket_sharp,
              color: Colors.black,
              size: 25,
            ),
            Text(
              'Winzee',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
      ),
body: tabs[_currentPage],
      /* <-----------------------Bottom navbar ------------------------> */

      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_currentPage,
        fixedColor: Colors.deepOrange[200],iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label:"home",
            backgroundColor: Colors.deepOrange[200],
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label :"Calendar",
              backgroundColor: Colors.deepOrange[200]),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
            backgroundColor: Colors.deepOrange[200],
          ),
        ],
        onTap: (index)
        {
          setState(() {
           _currentPage = index;
          });
        },
        // child: new Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: <Widget>[
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.menu,),
        //       iconSize: 40.0,
        //
        //     ),
        //     IconButton(
        //       onPressed: () {
        //         Navigator.pushReplacement(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => Fixture(),),);
        //       },
        //       icon: Icon(Icons.calendar_today_sharp),
        //       iconSize: 40.0,
        //
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.person),
        //       iconSize: 40.0,
        //
        //     ),
        //   ],
        // ),
      ),
      /* <-----------------------bottom navbar------------------------> */

      /* <-----------------------floating Button------------------------> */

      // floatingActionButton: new FloatingActionButton(
      //   child: Icon(Icons.add ,color: Colors.black,size: 30,),
      //   backgroundColor: Colors.deepOrange[200],
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /* <-----------------------floating Button------------------------> */
    );
  }
}
