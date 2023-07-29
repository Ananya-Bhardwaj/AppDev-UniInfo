import 'package:application/home.dart';
import 'package:application/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home': (context) => HomePage(),
      'result': (context) => ResultPage(),  
    },
  ));
}
