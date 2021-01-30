import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return Dialog(
      backgroundColor: Colors.white.withOpacity(conopa),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Container(
        height: 500.0,
        width: 360.0,
        child: Column(
          children: <Widget>[
            Container(
              width: 325,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
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
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.format_size,
                    color: Colors.white70,
                  ),
                  new Slider(
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
                  Text(
                    '${zikirfontayar.toStringAsFixed(0)}',
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.vibration,
                    color: Colors.white70,
                  ),
                  new Slider(
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
                  Text(
                    '${vibra.toString()}',
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black54),
              child: SwitchListTile(
                activeColor: Colors.white,
                inactiveThumbColor: Colors.black,
                title: const Text('Lights'),
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
                  color: _lights == true ? Colors.black : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
