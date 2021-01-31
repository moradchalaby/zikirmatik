import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

import 'package:vibration/vibration.dart';

import 'veri_provider.dart';

class Ayarlar extends StatefulWidget {
  @override
  _AyarlarState createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  double zikirfontayar = 225;
  double conopa = 1.0;
  bool _lights = true;
  int vibra = 255;
  @override
  void initState() {
    super.initState();
    zikirfontayar =
        Provider.of<FontModel>(context, listen: false).zikirfontItems;
    _lights = Provider.of<LightModel>(context, listen: false).lightItems;
    vibra = Provider.of<VibraModel>(context, listen: false).vibraItems;
  }

  @override
  Widget build(BuildContext context) {
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp; //specify hp
    return Dialog(
      backgroundColor: Colors.white.withOpacity(conopa),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Container(
        height: hp(50),
        width: wp(80),
        child: Column(
          children: <Widget>[
            Container(
              width: wp(100),
              height: hp(5),
              decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: wp(10),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: hp(0.2),
            ),
            Container(
              width: wp(80),
              height: wp(12),
              decoration: BoxDecoration(color: Colors.black54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.format_size,
                    color: Colors.white70,
                    size: wp(5),
                  ),
                  SizedBox(
                    width: wp(4),
                  ),
                  Container(
                    width: wp(60),
                    child: new Slider(
                      activeColor: Colors.black54,
                      inactiveColor: Colors.black12,
                      value: zikirfontayar,
                      min: 1,
                      max: 363,
                      onChangeEnd: (double value) {
                        setState(() {
                          conopa = 1.0;
                        });
                      },
                      onChangeStart: (double value) {
                        setState(() {
                          conopa = 0.0;
                        });
                      },
                      onChanged: (double value) {
                        setState(() {
                          zikirfontayar = value;
                        });
                        Provider.of<FontModel>(context, listen: false)
                            .setvalue(value);
                      },
                    ),
                  ),
                  Container(
                    width: wp(5),
                    child: Text(
                      '${zikirfontayar.toStringAsFixed(0)}',
                      style:
                          TextStyle(color: Colors.white70, fontSize: wp(2.5)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: hp(0.2),
            ),
            Container(
              width: wp(80),
              height: wp(12),
              decoration: BoxDecoration(color: Colors.black54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.vibration,
                    color: Colors.white70,
                    size: wp(5),
                  ),
                  SizedBox(
                    width: wp(4),
                  ),
                  Container(
                    width: wp(60),
                    child: new Slider(
                      activeColor: Colors.black54,
                      inactiveColor: Colors.black12,
                      value: vibra.toDouble(),
                      divisions: 255,
                      min: 1,
                      max: 255,
                      onChanged: (double valvib) {
                        setState(() {
                          vibra = valvib.toInt();
                        });
                        Vibration.vibrate(
                            duration: 500, amplitude: valvib.toInt());
                        Provider.of<VibraModel>(context, listen: false)
                            .setvalue(valvib.toInt());
                      },
                    ),
                  ),
                  Container(
                    width: wp(5),
                    child: Text(
                      '${vibra.toString()}',
                      style:
                          TextStyle(color: Colors.white70, fontSize: wp(2.5)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: hp(0.2),
            ),
            Container(
              width: wp(80),
              height: wp(12),
              decoration: BoxDecoration(color: Colors.black54),
              child: SwitchListTile(
                activeColor: Colors.white,
                inactiveThumbColor: Colors.black,
                value: _lights,
                onChanged: (bool value) {
                  setState(() {
                    _lights = value;
                  });
                  Provider.of<LightModel>(context, listen: false)
                      .setvalue(value);
                },
                secondary: Icon(
                  Icons.lightbulb_outline,
                  color: _lights == false ? Colors.black : Colors.white,
                  size: wp(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
