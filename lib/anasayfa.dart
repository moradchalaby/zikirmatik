import 'package:flutter/material.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'ayar.dart';
import 'duzenle.dart';
import 'liste.dart';
import 'veri_provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color tcol;
  Color gcolor1;
  Color gcolor2 = Colors.black;
  Color gcolor3 = Colors.black54;
  Color gcolor4 = Colors.red;
  bool scr;
  bool _isShowDial = false;
  int sayici = 0;

  @override
  void initState() {
    super.initState();
    sayici = Provider.of<SayacModel>(context, listen: false).sayacItems;

    scr = Provider.of<LightModel>(context, listen: false).lightItems;
  }

//! Menü düğmesi
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
    return Consumer<SayacModel>(
      builder: (context, sayacmodel, child) {
        return Consumer<FontModel>(
          builder: (context, fontmodel, child) {
            return Consumer<LightModel>(
              builder: (context, lightmodel, child) {
                return Consumer<VibraModel>(
                  builder: (context, vibramodel, child) {
                    return Scaffold(
                      //! ANA sayfa
                      body: InkWell(
                        onLongPress: () {
                          if (scr) {
                            setState(() {
                              scr = false;
                            });
                          } else {
                            setState(() {
                              scr = true;
                            });
                          }
                          Provider.of<LightModel>(context, listen: false)
                              .setvalue(scr);
                        },
                        onTap: () {
                          if ((sayici + 1) % 33 == 0) {
                            Vibration.vibrate(
                                duration: 300, amplitude: vibramodel.vibra);
                            print('TİTREDİ');
                          }
                          setState(() {
                            sayici++;
                          });

                          Provider.of<SayacModel>(context, listen: false)
                              .setvalue(sayici);
                        },
                        child: Container(
                          color: lightmodel.scolor,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${sayacmodel.sayac}',
                                  style: TextStyle(
                                      color: lightmodel.wcolor,
                                      fontSize: fontmodel.zikirfont),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      floatingActionButton: _getFloatingActionButton(),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

// ! Menü düğmesi
  Widget _getFloatingActionButton() {
    return Consumer<LightModel>(
      builder: (context, lightmodel, child) {
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
                color: lightmodel.wcolor,
              ),
              elevation: 0,
              highlightElevation: 7,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              onPressed: () {},
              closeMenuChild: Icon(
                Icons.close,
                color: lightmodel.wcolor,
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
                showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      final curvedValue =
                          Curves.easeInOutBack.transform(a1.value) - 1.0;
                      return Transform(
                        transform: Matrix4.translationValues(
                            0.0, curvedValue * 200, 0.0),
                        child: Opacity(opacity: a1.value, child: Ayarlar()),
                      );
                    },
                    transitionDuration: Duration(milliseconds: 700),
                    barrierDismissible: true,
                    barrierLabel: '',
                    context: context,
                    pageBuilder: (context, animation1, animation2) {});
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
                _isShowDial = false;
                //!Liste Sayfası
                showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      final curvedValue =
                          Curves.easeInOutBack.transform(a1.value) - 1.0;
                      return Transform(
                        transform: Matrix4.translationValues(
                            0.0, curvedValue * 200, 0.0),
                        child: Opacity(
                            opacity: a1.value,
                            child: Listeler(
                              themecolor: lightmodel.scolor,
                              writecolor: lightmodel.wcolor,
                            )),
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
                //!Yeni kayıt ve Düzenleme Sayfası
                _isShowDial = false;
                showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      final curvedValue =
                          Curves.easeInOutBack.transform(a1.value) - 1.0;
                      return Transform(
                        transform: Matrix4.translationValues(
                            0.0, curvedValue * 200, 0.0),
                        child: Opacity(opacity: a1.value, child: Duzenle()),
                      );
                    },
                    transitionDuration: Duration(milliseconds: 700),
                    barrierDismissible: true,
                    barrierLabel: '',
                    context: context,
                    pageBuilder: (context, animation1, animation2) {});
              },
              backgroundColor: Colors.deepPurple,
            ),
            //! Sıfırla

            FloatingActionButton(
              mini: true,
              child: Icon(Icons.replay_outlined),
              onPressed: () {
                _isShowDial = false;
                showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      final curvedValue =
                          Curves.easeInOutBack.transform(a1.value) - 1.0;
                      return Consumer<SayacModel>(
                        builder: (context, sayacmodel, child) {
                          return Transform(
                            transform: Matrix4.translationValues(
                                0.0, curvedValue * 200, 0.0),
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
                                          sayacmodel.reset();
                                          sayici = 0;
                                        });
                                      },
                                      child: Icon(Icons.check,
                                          color: Colors.green[900])),
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.red[900],
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
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
      },
    );
  }
}
