import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'anasayfa.dart';
import 'veri_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox('Settings');
  await Hive.openBox('Zikirler'); //todo: Burada Kaldık bunu da hallet bbakalım
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
