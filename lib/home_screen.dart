import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_nav_drawer/nav_drawer/navigation_controller.dart';
import 'package:sliding_nav_drawer/second_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Text('Home-Screen'),
          RaisedButton(onPressed: () {
            Provider.of<NavigationController>(context, listen: false).showScreen(SecondScreen());
          })
        ],
      ),
    );
  }
}