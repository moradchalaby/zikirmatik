import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class Duzenle extends StatefulWidget {
  Duzenle({Key key}) : super(key: key);

  @override
  _DuzenleState createState() => _DuzenleState();
}

class _DuzenleState extends State<Duzenle> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp; //specify hp
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Container(
        height: hp(50),
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
                                  onPressed: () {},
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
