import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:responsive_screen/responsive_screen.dart';

class YeniKayit extends StatefulWidget {
  YeniKayit({Key key}) : super(key: key);

  @override
  _YeniKayitState createState() => _YeniKayitState();
}

class _YeniKayitState extends State<YeniKayit> {
  final baslik = TextEditingController();
  final titresim = TextEditingController();
  final dongu = TextEditingController();
  final zikirmetin = TextEditingController();
  Map zikirsave = {
    'baslik': 'başlık',
    'titresim': 33,
    'dongu': 99,
    'zikirmetin': 'Allah',
    'zikirsayac': 0,
  };
  Box zikirBox;
  @override
  void initState() {
    zikirBox = Hive.box('Zikirler');
    super.initState();
  }

  void dispose() {
    zikirmetin.dispose();
    baslik.dispose();
    dongu.dispose();
    titresim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp; //specify hp
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Container(
        height: MediaQuery.of(context).size.width,
        width: wp(80),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: hp(4.5)),
                  //? Ad
                  //? zikir sınır
                  //? zikir sayı=0
                  //? zikir dua

                  Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                width: wp(75),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    controller: baslik,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                      icon: Icon(Icons.turned_in_outlined),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: wp(37.5),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: titresim,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                      icon: Icon(Icons.vibration),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: wp(37.5),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    controller: dongu,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                      icon: Icon(Icons.replay),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: wp(75),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                    controller: zikirmetin,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          borderSide:
                                              BorderSide(color: Colors.blue)),
                                      icon: Icon(Icons.text_snippet_sharp),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 1)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: FloatingActionButton(
                                  child: Icon(Icons.add),
                                  onPressed: () {
                                    zikirsave['baslik'] = baslik.text;
                                    zikirsave['titresim'] =
                                        int.parse(titresim.text);
                                    zikirsave['dongu'] = int.parse(dongu.text);
                                    zikirsave['zikirmetin'] = zikirmetin.text;
                                    zikirsave['zikirsayac'] = 0;
                                    print(zikirsave);
                                    var asd = zikirBox.add(zikirsave);
                                    print(asd);
                                    Navigator.of(context).pop();
                                  },
                                  backgroundColor: Colors.blue[900],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: FloatingActionButton(
                                  child: Icon(
                                    Icons.close,
                                  ),
                                  backgroundColor: Colors.red[900],
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: wp(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: hp(0.01),
                      ),
                      Container(
                        width: wp(75),
                        height: hp(5),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: wp(15),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.create_new_folder_rounded,
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
