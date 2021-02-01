import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zikirmatik/readandwrite.dart';

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

//! buraya clas gelecek web sitesine tekrar bak babab.... https://flutter.dev/docs/cookbook/persistence/reading-writing-files

class SayacModel extends ChangeNotifier {
  int sayac = 0;

  int get sayacItems => sayac;

  void setvalue(int value) {
    sayac = value;

    notifyListeners();
  }

  void reset() {
    sayac = 0;

    notifyListeners();
  }
}

class LightModel extends ChangeNotifier {
  bool light = true;
  Color scolor = Colors.white;
  Color wcolor = Colors.black54;
  bool get lightItems => light;

  void setvalue(bool value) {
    light = value;
    scolor = light == true ? Colors.white : Colors.black;
    wcolor = light == true ? Colors.black54 : Colors.grey[900];
    notifyListeners();
  }

  void reset() {
    light = true;
    scolor = light == true ? Colors.white : Colors.black;
    wcolor = light == true ? Colors.black54 : Colors.grey[900];
    notifyListeners();
  }
}

class VibraModel extends ChangeNotifier {
  int vibra = 255;
  int get vibraItems => vibra;

  void setvalue(int value) {
    vibra = value;

    notifyListeners();
  }

  void reset() {
    vibra = 255;
    notifyListeners();
  }
}
