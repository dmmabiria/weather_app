import 'package:flutter/material.dart';
import 'package:weather_app/Pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather API App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
