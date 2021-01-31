import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

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

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/data/ayar.json');
}

Future<int> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file
    String contents = await file.readAsString();

    return int.parse(contents);
  } catch (e) {
    // If encountering an error, return 0
    return 0;
  }
}

Future<File> writeCounter(int counter) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString('$counter');
}

class SayacModel extends ChangeNotifier {
  int sayac = 0;

  int get sayacItems => sayac;

  void setvalue(int value) {
    sayac = value;
    writeCounter(value);
    notifyListeners();
  }

  void reset() {
    sayac = 0;
    writeCounter(sayac);
    notifyListeners();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data/ayar.json');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
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
