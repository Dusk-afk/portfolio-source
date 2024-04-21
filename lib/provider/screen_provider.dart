import 'package:flutter/material.dart';

class ScreenProvider with ChangeNotifier {
  bool _isMobile = false;
  bool get isMobile => _isMobile;
  set isMobile(bool value) {
    if (_isMobile == value) return;
    _isMobile = value;
    notifyListeners();
  }
}
