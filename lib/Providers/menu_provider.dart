import 'package:flutter/material.dart';

class MenuStateProvider extends ChangeNotifier {
  bool _isMenuOpen = false;
  bool get menuState => _isMenuOpen;

  void changeMenuState({required bool updatedMenuState}) {
    _isMenuOpen = updatedMenuState;
    notifyListeners();
  }
}
