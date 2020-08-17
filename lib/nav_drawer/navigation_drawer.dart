import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_nav_drawer/home_screen.dart';
import 'package:sliding_nav_drawer/nav_drawer/nav_footer_item.dart';
import 'package:sliding_nav_drawer/nav_drawer/nav_header_item.dart';
import 'package:sliding_nav_drawer/nav_drawer/nav_list_item.dart';
import 'package:sliding_nav_drawer/nav_drawer/navigation_controller.dart';

class NavigationDrawer extends StatefulWidget {
  final Map<String, Widget> items;
  final double xOffset;
  final double yOffset;
  final double scaleFactor;
  final Color drawerBackground;
  final String headerTitle;
  final IconData headerIcon;

  NavigationDrawer(
      {Key key,
      Map<String, Widget> items,
      double xOffset,
      double yOffset,
      double scaleFactor,
      Color drawerBackground,
      String headerTitle,
      IconData headerIcon})
      : this.items = items ?? Map(),
        this.xOffset = xOffset ?? 256,
        this.yOffset = yOffset ?? 48,
        this.scaleFactor = scaleFactor ?? 0.85,
        this.drawerBackground = drawerBackground ?? Colors.blueGrey[900],
        this.headerTitle = headerTitle ?? '',
        this.headerIcon = headerIcon ?? Icons.account_circle,
        super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  double _xOffset = 0.0;
  double _yOffset = 0.0;
  double _scaleFactor = 1.0;

  bool _isDrawerOpen = false;

  Widget _currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = new NavigationController(
        context, widget.xOffset, widget.yOffset, widget.scaleFactor);

    navigationController.addListener(() {
      setState(
        () {
          _isDrawerOpen = navigationController.isDrawerOpen;
          _xOffset = navigationController.xOffset;
          _yOffset = navigationController.yOffset;
          _scaleFactor = navigationController.scaleFactor;
          if (navigationController.currentScreen != null) {
            _currentScreen = navigationController.currentScreen;
          }
        },
      );
    });

    return ChangeNotifierProvider.value(
      value: navigationController,
      child: Builder(
        builder: (context) {
          return Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                color: widget.drawerBackground,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeaderItem(
                      title: widget.headerTitle,
                      icon: widget.headerIcon,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.items.length,
                      itemBuilder: (context, index) {
                        return DrawerItem(
                            title: widget.items.keys.elementAt(index),
                            index: index);
                      },
                    ),
                    FooterItem(
                      title: 'Settings',
                      icon: Icons.settings,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_isDrawerOpen) {
                    Provider.of<NavigationController>(context, listen: false)
                        .closeDrawer();
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  transform: Matrix4.translationValues(_xOffset, _yOffset, 0.0)
                    ..scale(_scaleFactor),
                  decoration: BoxDecoration(
                    borderRadius:
                        _isDrawerOpen ? BorderRadius.circular(8.0) : null,
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: _isDrawerOpen
                              ? BorderRadius.only(topLeft: Radius.circular(8.0))
                              : null,
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              iconSize: 28,
                              icon: Icon(_isDrawerOpen
                                  ? Icons.arrow_back
                                  : Icons.menu),
                              onPressed: () {
                                if (_isDrawerOpen) {
                                  Provider.of<NavigationController>(context,
                                          listen: false)
                                      .closeDrawer();
                                } else {
                                  Provider.of<NavigationController>(context,
                                          listen: false)
                                      .openDrawer();
                                }
                              },
                            ),
                            SizedBox(width: 32),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: _currentScreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
