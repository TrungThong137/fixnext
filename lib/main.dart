import 'package:fixnext/page/back_home.dart';
import 'package:fixnext/page/break_first.dart';
import 'package:fixnext/page/comparison.dart';
import 'package:fixnext/page/schedule.dart';
import 'package:fixnext/page/scrollAnimation.dart';
import 'package:fixnext/page/test.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BreakFirst()
    );
  }
}