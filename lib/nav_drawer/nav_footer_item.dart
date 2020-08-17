import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_controller.dart';

class FooterItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const FooterItem({Key key, this.title, this.icon}) : super(key: key);

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
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
