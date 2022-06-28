import 'package:bulleted_list/bulleted_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hey_auto/Authentication/Register.dart';
import 'package:hey_auto/main.dart';
import 'package:lottie/lottie.dart';

class Driver_Profile extends StatefulWidget {
  const Driver_Profile({Key? key}) : super(key: key);

  @override
  State<Driver_Profile> createState() => _Driver_ProfileState();
}

class _Driver_ProfileState extends State<Driver_Profile> {
  List<String> listItems = [
    "Drop a traveller",
    "Ask traveller for rating, more the rating more the credit points",
    "Based on the frequency and no. of trips",
    "Based on total distance travelled"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        spreadRadius: 10, //New
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/gold_coin.json"),
                        Text("You have", style: h2),
                        Text("10", style: h3_bold),
                        Text("Credit coins", style: h2),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        spreadRadius: 10, //New
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("How to earn credit coins?", style: h2_bold),
                        SizedBox(
                          height: 5,
                        ),
                        BulletedList(
                          listItems: listItems,
                          style: h14,
                          bulletColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () async {
                        driver = false;
                        traveller = false;
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => Register()));
                      },
                      child: Text(
                        "Sign out",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle h3_bold = TextStyle(
  fontSize: 30,
  fontFamily: GoogleFonts.poppins().fontFamily,
  fontWeight: FontWeight.bold,
);
TextStyle h2_bold = TextStyle(
  fontSize: 20,
  fontFamily: GoogleFonts.poppins().fontFamily,
  fontWeight: FontWeight.bold,
);
TextStyle h14_bold = TextStyle(
  fontSize: 10,
  fontFamily: GoogleFonts.poppins().fontFamily,
  fontWeight: FontWeight.bold,
);
TextStyle h3 = TextStyle(
  fontSize: 30,
  fontFamily: GoogleFonts.poppins().fontFamily,
  fontWeight: FontWeight.normal,
);
TextStyle h2 = TextStyle(
  fontSize: 20,
  fontFamily: GoogleFonts.poppins().fontFamily,
  fontWeight: FontWeight.normal,
);
TextStyle h14 = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontFamily: GoogleFonts.poppins().fontFamily,
  fontWeight: FontWeight.normal,
);
