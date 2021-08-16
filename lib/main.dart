import 'package:flutter/material.dart';
import 'package:marthon1/profiles/profile1/profile_1.dart';
import 'package:marthon1/profiles/profile2/profile2.dart';
import 'package:marthon1/profiles/profile3/profile3.dart';

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
      home: Router(),
      routes: {
        '/profile1': (context) => Profile1(),
        '/profile2': (context) => Profile2(),
        '/profile3': (context) => Profile3(),
      },
    );
  }
}

var _colors = [
  Colors.teal,
  Colors.red,
  Colors.yellow,
  Colors.blue,
  Colors.pink,
  Colors.purple,
];

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              color: _colors[index],
              child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/profile' + (index + 1).toString());
                },
                title: Text('Profile' + (index + 1).toString()),
              ),
            );
          },
        ));
  }
}
