import 'package:flutter/material.dart';
import 'package:hey_auto/Authentication/Register.dart';
import 'package:hey_auto/Home%20-%20Copy.dart';
import 'package:hey_auto/driver_bnb.dart';
import 'package:hey_auto/main.dart';
import 'package:hey_auto/pages/Redirection.dart';
import 'package:hey_auto/pages/traveller_Home.dart';
import 'package:hey_auto/traveller_bnb.dart';

class Auth_Wrapper extends StatelessWidget {
  const Auth_Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (driver == true) {
      return Driver_bnb();
    } else if (traveller == true) {
      return Traveller_bnb();
    } else {
      return Register();
    }
  }
}
