import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class FontModel extends ChangeNotifier {
  Box settingBox;

  void setvalue(double value) {
    settingBox = Hive.box("Settings");

    settingBox.put('zikirfont', value);
    notifyListeners();
  }

  void reset() {
    settingBox = Hive.box("Settings");

    settingBox.put('zikirfont', 0.0);
    notifyListeners();
  }
}

class SayacModel extends ChangeNotifier {
  Box settingBox;

  void setvalue(int value) {
    settingBox = Hive.box("Settings");

    settingBox.put('sayac', value);
    notifyListeners();
  }

  void reset() {
    settingBox = Hive.box("Settings");

    settingBox.put('sayac', 0);
    notifyListeners();
  }
}

class LightModel extends ChangeNotifier {
  Box settingBox;

  void setvalue(bool value, String color1, String color2) {
    settingBox = Hive.box("Settings");

    settingBox.put('light', value);
    settingBox.put('color1', color1);
    settingBox.put('color2', color2);

    notifyListeners();
  }

  void reset() {
    settingBox = Hive.box("Settings");

    settingBox.put('light', true);
    settingBox.put('color2', '#7a7a7a');
    settingBox.put('color1', '#ffffff');

    notifyListeners();
  }
}

class VibraModel extends ChangeNotifier {
  Box settingBox;

  void setvalue(int value) {
    settingBox = Hive.box("Settings");

    settingBox.put('vibra', value);
    notifyListeners();
  }

  void reset() {
    settingBox = Hive.box("Settings");

    settingBox.put('vibra', 150);
    notifyListeners();
  }
}
