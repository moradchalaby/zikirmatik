import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:screen/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color tcol = Colors.black54;
  Color gcolor1 = Colors.white54;
  Color gcolor2 = Colors.black;
  Color gcolor3 = Colors.black54;
  Color gcolor4 = Colors.red;
  bool scr = false;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    Screen.setBrightness(-1);
    if (_counter % 33 == 0) {
      Vibration.vibrate();
      print('TİTREDİ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onLongPress: () {
          if (scr) {
            setState(() {
              tcol = Colors.black54;
              gcolor1 = Colors.white54;
              gcolor2 = Colors.black;
              gcolor3 = Colors.black54;
              gcolor4 = Colors.red;
              scr = false;
            });
          } else {
            setState(() {
              tcol = Colors.grey[900];
              gcolor1 = Colors.black;
              gcolor2 = Colors.black;
              gcolor3 = Colors.black;
              gcolor4 = Colors.black;
              scr = true;
            });
          }
        },
        onTap: () {
          _incrementCounter();
          setState(() {});
        },
        child: Container(
          color: gcolor1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_counter',
                  style: TextStyle(color: tcol, fontSize: 225),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('olduuu');
        },
        elevation: 0,
        highlightElevation: 7,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Icon(
          Icons.list,
          color: tcol,
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
