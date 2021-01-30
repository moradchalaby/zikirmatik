import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'veri_provider.dart';

class Ayarlar extends StatefulWidget {
  @override
  _AyarlarState createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  double zikirfontayar = 225;

  @override
  void initState() {
    super.initState();
    zikirfontayar =
        Provider.of<FontModel>(context, listen: false).zikirfontItems;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Container(
        height: 500.0,
        width: 360.0,
        child: Column(
          children: <Widget>[
            Text('Font: ${zikirfontayar.ceilToDouble()}'),
            Slider(
              value: zikirfontayar,
              min: 0,
              max: 363,
              label: 'font',
              onChanged: (double value) {
                setState(() {
                  zikirfontayar = value;
                });
                Provider.of<FontModel>(context, listen: false).setvalue(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
