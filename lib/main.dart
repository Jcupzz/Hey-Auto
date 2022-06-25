import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hey_auto/Home%20-%20Copy.dart';
import 'package:hey_auto/Home.dart';
import 'package:hey_auto/pages/Redirection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hey_auto/pages/traveller_Home.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()], //2.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Location(),
        // '/Redirection': (context) => const Redirection(),
        // '/second': (context) => const SecondScreen(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
