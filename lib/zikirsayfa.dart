import 'package:flutter/material.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:hexcolor/hexcolor.dart';
import 'anasayfa.dart';
import 'ayar.dart';
import 'duzenle.dart';
import 'liste.dart';
import 'veri_provider.dart';

class ZikirSayfa extends StatefulWidget {
  ZikirSayfa({Key key, this.zikirindex}) : super(key: key);

  final int zikirindex;

  @override
  _ZikirSayfaState createState() => _ZikirSayfaState();
}

class _ZikirSayfaState extends State<ZikirSayfa> {
  Color tcol;

  Color gcolor3 = Colors.black54;
  Color gcolor4 = Colors.red;
  bool scr;
  bool _isShowDial = false;
  int sayici;
  int zikirindex;
  Map zikirveri;
  Box zikirBox;

  Box settingBox;

  @override
  void initState() {
    super.initState();

    settingBox = Hive.box('Settings');
    zikirBox = Hive.box('Zikirler');
    scr = settingBox.get('light') == null ? true : settingBox.get('light');

    zikirveri = zikirBox.getAt(0);

    sayici = zikirveri['zikirsayac'];
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
                              .setvalue(
                                  scr,
                                  scr == true ? '#ffffff' : '#000000',
                                  scr == true ? '#000000' : '#ffffff');
                        },
                        onTap: () {
                          if ((sayici + 1) % zikirveri['titresim'] == 0) {
                            Vibration.vibrate(
                                duration: 300,
                                amplitude: settingBox.get('vibra'));
                            print('TİTREDİ');
                          }
                          setState(() {
                            sayici++;

                            if (sayici >= (zikirveri['dongu'] + 1)) {
                              sayici = 0;
                              Vibration.vibrate(
                                duration: 1000,
                                amplitude: 200,
                              );
                            }
                          });
                          zikirveri['zikirsayac'] = sayici;
                          zikirBox.putAt(zikirindex, zikirveri);
                        },
                        child: Container(
                          color: settingBox.get('light') == null
                              ? Colors.white
                              : HexColor(settingBox.get('color1')),
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 50, left: 5, right: 5),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        zikirveri["zikirmetin"],
                                        style: TextStyle(
                                          color: settingBox.get('light') == null
                                              ? Colors.black54
                                              : HexColor(
                                                  settingBox.get('color2')),
                                          fontSize: 24,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                Center(
                                  child: Text(
                                    '$sayici',
                                    style: TextStyle(
                                        color: settingBox.get('light') == null
                                            ? Colors.black54
                                            : HexColor(
                                                settingBox.get('color2')),
                                        fontSize: settingBox.get('zikirfont')),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 50, left: 5, right: 5),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        zikirveri["baslik"],
                                        style: TextStyle(
                                          color: settingBox.get('light') == null
                                              ? Colors.black54
                                              : HexColor(
                                                  settingBox.get('color2')),
                                          fontSize: 24,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                Positioned(
                                  left: 40,
                                  bottom: 30,
                                  child: FloatingActionButton(
                                    mini: true,
                                    child: Icon(
                                      Icons.exposure_neg_1_rounded,
                                      color: settingBox.get('light') == null
                                          ? Colors.black54
                                          : HexColor(settingBox.get('color2')),
                                    ),
                                    elevation: 0,
                                    highlightElevation: 7,
                                    hoverColor: settingBox.get('light') == null
                                        ? Colors.black54
                                        : HexColor(settingBox.get('color2')),
                                    splashColor: settingBox.get('light') == null
                                        ? Colors.black54
                                        : HexColor(settingBox.get('color2')),
                                    backgroundColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        sayici--;
                                      });
                                      zikirveri['zikirsayac'] = sayici;
                                      zikirBox.putAt(zikirindex, zikirveri);
                                    },
                                  ),
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
                color: settingBox.get('light') == null
                    ? Colors.black54
                    : HexColor(settingBox.get('color2')),
              ),
              elevation: 0,
              highlightElevation: 7,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              onPressed: () {},
              closeMenuChild: Icon(
                Icons.close,
                color: settingBox.get('light') == null
                    ? Colors.black54
                    : HexColor(settingBox.get('color2')),
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
                              themecolor: settingBox.get('light') == null
                                  ? Colors.white
                                  : HexColor(settingBox.get('color1')),
                              writecolor: settingBox.get('light') == null
                                  ? Colors.black
                                  : HexColor(settingBox.get('color2')),
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

            FloatingActionButton(
              mini: true,
              child: Icon(
                Icons.home,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: HexColor(settingBox.get('color2')),
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
