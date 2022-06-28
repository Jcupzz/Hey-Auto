import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hey_auto/Authentication/Register.dart';
import 'package:hey_auto/driver_bnb.dart';
import 'package:hey_auto/traveller_bnb.dart';
import 'package:hey_auto/Home%20-%20Copy.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Redirection extends StatefulWidget {
  const Redirection({Key? key}) : super(key: key);

  @override
  State<Redirection> createState() => _RedirectionState();
}

class _RedirectionState extends State<Redirection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Are you an autorickshaw driver or traveller?", style: h2),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/auto.gif",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                    onPressed: () async {
                      await SharedPreferences.getInstance();
                      prefs.setString("switcher", "driver");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => Driver_bnb()));
                    },
                    child: Align(
                      alignment: Alignment(0, 0.95),
                      child: Text(
                        "I'm an autorickshaw driver",
                        style: h2,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      textStyle: h2,
                      primary: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/traveller.gif",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                    onPressed: () async {
                      await SharedPreferences.getInstance();
                      prefs.setString("switcher", "traveller");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => Traveller_bnb()));
                    },
                    child: Align(
                      alignment: Alignment(0, 0.95),
                      child: Text(
                        "I'm a traveller",
                        style: h2,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      textStyle: h2,
                      primary: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
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
