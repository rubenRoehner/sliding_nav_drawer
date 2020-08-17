import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_nav_drawer/nav_drawer/navigation_controller.dart';

class HeaderItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const HeaderItem({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<NavigationController>(context).onHeaderClicked();
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
