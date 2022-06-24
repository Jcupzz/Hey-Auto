import 'package:flutter/material.dart';
import 'package:hey_auto/Home.dart';
import 'package:hey_auto/pages/Redirection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/Redirection',
      routes: {
        '/': (context) => const Home(),
        '/Redirection': (context) => const Redirection(),
        // '/second': (context) => const SecondScreen(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
