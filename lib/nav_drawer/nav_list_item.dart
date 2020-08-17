import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_controller.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final int index;
  const DrawerItem({Key key, this.title, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<NavigationController>(context, listen: false)
            .onMenuItemClicked(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 220, 220, 220),
          ),
        ),
      ),
    );
  }
}
