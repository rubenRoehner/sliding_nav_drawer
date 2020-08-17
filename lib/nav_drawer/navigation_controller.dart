import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {

  final double openXOffset;
  final double openYOffset;
  final double openScaleFactor;

  double xOffset = 0.0;
  double yOffset = 0.0;
  double scaleFactor = 1.0;

  bool isDrawerOpen = false;

  Widget currentScreen;
  final BuildContext context;

  NavigationController(this.context, this.openXOffset, this.openYOffset, this.openScaleFactor);

  void openDrawer() {
    scaleFactor = openScaleFactor;
    xOffset = openXOffset;
    yOffset = openYOffset;
    isDrawerOpen = true;
    notifyListeners();
  }

  void closeDrawer() {
    xOffset = 0.0;
    yOffset = 0.0;
    scaleFactor = 1.0;
    isDrawerOpen = false;
    notifyListeners();
  }

  void onMenuItemClicked(int index) {
    print(index);
    closeDrawer();
  }

  void showScreen(Widget screen) {
    currentScreen = screen;
    notifyListeners();
  }

  void onHeaderClicked() {

  }

  void onFooterClicked() {
    
  }


  
}
