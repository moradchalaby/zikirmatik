import 'package:flutter/material.dart';

class FontModel extends ChangeNotifier {
  double zikirfont = 225;

  double get zikirfontItems => zikirfont;

  void setvalue(double value) {
    zikirfont = value;
    notifyListeners();
  }

  void reset() {
    zikirfont = 225;
    notifyListeners();
  }
}
