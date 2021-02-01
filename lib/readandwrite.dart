import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;
      print(file);
      // Read the file
      String contents = await file.readAsString();
      var a = contents;
      return a;
    } catch (e) {
      // If encountering an error, return 0
      return '0';
    }
  }

  Future<File> writeCounter(String sayici) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$sayici');
  }
}

//*********************************************************************************************************************** */
class AyarVeri {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.json');
  }

  Future<List> ayarGetir() async {
    try {
      final file = await _localFile;
      print(file);
      // Read the file
      String contents = await file.readAsString();
      var a = json.decode(contents);
      return a;
    } catch (e) {
      // If encountering an error, return 0
      return ['none'];
    }
  }

  Future<File> ayarKaydet(String settings) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$settings');
  }
}

//* read
/*
*    void initState() {
*       super.initState();
*       widget.storage.readCounter().then((List value) {
*         setState(() {
*           settings = value;
*         });
*       });
*     }
   */

//? Write
/* 
? Future<File> _incrementCounter() {
?   setState(() {
?     age = new Random();
?     settings.clear();
?     settings = {
?       'name': 'Murat',
?       'surname': 'ÇELEBİ',
?       'age': age.nextInt(100).toString()
?     };
?     jsonset = json.encode(settings);
?     print(jsonset);
?   });

    !Write the variable as a string to the file.
 ?   return widget.storage.writeCounter(jsonset);
  } */

//! ÖRNEK KULLANIM
/* 
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
? This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(storage: CounterStorage()),
    );
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.json');
  }

  Future<List> readCounter() async {
    try {
      final file = await _localFile;
      print(file);
      ? Read the file
      String contents = await file.readAsString();
      var a = json.decode(contents);
      return a;
    } catch (e) {
      ? If encountering an error, return 0
      return ['none'];
    }
  }

  Future<File> writeCounter(String settings) async {
    final file = await _localFile;

    ? Write the file
    return file.writeAsString('$settings');
  }
}

class FlutterDemo extends StatefulWidget {
  final CounterStorage storage;

  FlutterDemo({Key key, @required this.storage}) : super(key: key);

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  var settings;
  var jsonset;
  var age;
  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((List value) {
      setState(() {
        settings = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      age = new Random();
      settings.clear();
      settings = {
        'name': 'Murat',
        'surname': 'ÇELEBİ',
        'age': age.nextInt(100).toString()
      };
      jsonset = json.encode(settings);
      print(jsonset);
    });

  ? Write the variable as a string to the file.
    return widget.storage.writeCounter(jsonset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing Files')),
      body: Center(
        child: Text(
          'Button tapped $settings time${settings['age']}.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


*/
