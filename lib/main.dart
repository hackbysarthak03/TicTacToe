import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Start.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
        SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

    return MaterialApp(
      home: Start(),
      debugShowCheckedModeBanner: false,
    );
  }
}
