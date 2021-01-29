import 'dart:html';

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:screen/screen.dart';

import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'package:zikirmatik/liste.dart';

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
  bool _isShowDial = false;
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

  Widget _offsetPopup() => PopupMenuButton<int>(
      itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text(
                "Flutter Open",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Text(
                "Flutter Tutorial",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ),
          ],
      icon: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: ShapeDecoration(
            color: Colors.blue,
            shape: StadiumBorder(
              side: BorderSide(color: Colors.white, width: 2),
            )),
        //child: Icon(Icons.menu, color: Colors.white), <-- You can give your icon here
      ));
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
      floatingActionButton: _getFloatingActionButton(),
    );
  }

  Widget _getFloatingActionButton() {
    return SpeedDialMenuButton(
      //if needed to close the menu after clicking sub-FAB
      isShowSpeedDial: _isShowDial,
      //manually open or close menu
      updateSpeedDialStatus: (isShow) {
        //return any open or close change within the widget
        this._isShowDial = isShow;
      },
      //general init
      isMainFABMini: false,
      mainMenuFloatingActionButton: MainMenuFloatingActionButton(
          mini: false,
          child: Icon(
            Icons.menu_sharp,
            color: tcol,
          ),
          elevation: 0,
          highlightElevation: 7,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          onPressed: () {},
          closeMenuChild: Icon(
            Icons.close,
            color: tcol,
          ),
          closeMenuForegroundColor: Colors.transparent,
          closeMenuBackgroundColor: Colors.transparent),
      floatingActionButtonWidgetChildren: <FloatingActionButton>[
        //! Ayarlar
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.settings),
          onPressed: () {
            //if need to close menu after click
            _isShowDial = false;
            setState(() {});
          },
          backgroundColor: Colors.pink,
        ),

        //! Listeler
        FloatingActionButton(
          mini: true,
          child: Icon(Icons.list),
          onPressed: () {
            /* showDialog(
              context: context,
              builder: (context) {
                return Listeler();
              },
            ); */
            showGeneralDialog(
                barrierColor: Colors.black.withOpacity(0.5),
                transitionBuilder: (context, a1, a2, widget) {
                  final curvedValue =
                      Curves.easeInOutBack.transform(a1.value) - 1.0;
                  return Transform(
                    transform:
                        Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                    child: Opacity(opacity: a1.value, child: listeler()),
                  );
                },
                transitionDuration: Duration(milliseconds: 700),
                barrierDismissible: true,
                barrierLabel: '',
                context: context,
                pageBuilder: (context, animation1, animation2) {});
          },
          backgroundColor: Colors.blueAccent,
        ),
        //! Kaydet

        FloatingActionButton(
          mini: true,
          child: Icon(
            Icons.save,
          ),
          onPressed: () {
            //sadfsdf
          },
          backgroundColor: Colors.deepPurple,
        ),
        //! Sıfırla

        FloatingActionButton(
          mini: true,
          child: Icon(Icons.replay_outlined),
          onPressed: () {
            showGeneralDialog(
                barrierColor: Colors.black.withOpacity(0.5),
                transitionBuilder: (context, a1, a2, widget) {
                  final curvedValue =
                      Curves.easeInOutBack.transform(a1.value) - 1.0;
                  return Transform(
                    transform:
                        Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                    child: Opacity(
                      opacity: a1.value,
                      child: AlertDialog(
                        backgroundColor: Colors.red[100],
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        title: Text('Yenile!!'),
                        content: Text('Sayaç sıfırlansın mı?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _counter = 0;
                                });
                              },
                              child:
                                  Icon(Icons.check, color: Colors.green[900])),
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Icon(
                                Icons.cancel_outlined,
                                color: Colors.red[900],
                              ))
                        ],
                      ),
                    ),
                  );
                },
                transitionDuration: Duration(milliseconds: 200),
                barrierDismissible: true,
                barrierLabel: '',
                context: context,
                pageBuilder: (context, animation1, animation2) {});
          },
          backgroundColor: Colors.red[900],
        ),
      ],
      isSpeedDialFABsMini: true,
      paddingBtwSpeedDialButton: 30.0,
    );
  }
}
