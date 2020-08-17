import 'package:flutter/material.dart';
import 'package:sliding_nav_drawer/home_screen.dart';
import 'package:sliding_nav_drawer/second_screen.dart';

import 'nav_drawer/navigation_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> items = Map();
    items['Home'] = HomeScreen();
    items['Second Screen'] = SecondScreen();
    return SafeArea(
      child: Scaffold(
        body: NavigationDrawer(
          headerTitle: 'User',
          items: items,
        ),
      ),
    );
  }
}
