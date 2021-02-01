import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikirmatik/readandwrite.dart';

import 'anasayfa.dart';
import 'veri_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FontModel(),
      child: ChangeNotifierProvider(
        create: (context) => SayacModel(),
        child: ChangeNotifierProvider(
          create: (context) => LightModel(),
          child: ChangeNotifierProvider(
            create: (context) => VibraModel(),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(),
              home: MyHomePage(
                title: 'Flutter Demo Home Page',
                storage: CounterStorage(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
