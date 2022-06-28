import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hey_auto/traveller_bnb.dart';
import 'package:hey_auto/Home%20-%20Copy.dart';
import 'package:hey_auto/Home.dart';
import 'package:hey_auto/auth_wrapper.dart';
import 'package:hey_auto/pages/Redirection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hey_auto/pages/traveller_Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

var prefs;
bool driver = false;
bool traveller = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  final String? action = prefs.getString('switcher');
  print("############################" + action.toString());
  if (action.toString() == "driver") {
    driver = true;
  } else if (action.toString() == "traveller") {
    traveller = true;
  } else {
    driver = false;
    traveller = false;
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()], //2.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',

      routes: {
        '/': (context) => const Auth_Wrapper(),
        // '/Redirection': (context) => const Redirection(),
        // '/second': (context) => const SecondScreen(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
