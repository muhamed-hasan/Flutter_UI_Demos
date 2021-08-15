import 'package:flutter/material.dart';
import 'package:marthon1/profiles/profile1/profile_1.dart';
import 'package:marthon1/profiles/profile2/profile2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile2(),
    );
  }
}