import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_auto/Home%20-%20Copy.dart';
import 'package:hey_auto/Profile/Driver_Profile.dart';
import 'package:hey_auto/Profile/Traveller_Profile.dart';

class Driver_bnb extends StatefulWidget {
  @override
  _Driver_bnbState createState() => _Driver_bnbState();
}

class _Driver_bnbState extends State<Driver_bnb> {
  int _page = 0;
  final pageOption = [
    Driver_Home(),
    Driver_Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade300,
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 200),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 60,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 20,
            color: Colors.black,
          ),
          // Icon(
          //   Icons.add_circle_rounded,
          //   size: 20,
          //   color: Colors.black,
          // ),
          // Icon(
          //   Icons.location_on_outlined,
          //   color: Colors.black,
          //   size: 20,
          // ),
          Icon(
            Icons.person,
            size: 20,
            color: Colors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: pageOption[_page],
    );
  }
}
