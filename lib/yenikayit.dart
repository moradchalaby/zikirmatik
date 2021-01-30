import 'package:flutter/material.dart';

class Yenikayit extends StatefulWidget {
  @override
  _YenikayitState createState() => _YenikayitState();
}

class _YenikayitState extends State<Yenikayit> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Container(
        height: 500.0,
        width: 360.0,
        child: Column(
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.1,
                      ),
                      Container(
                        width: 325,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
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
                                Icons.create_new_folder,
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

            SizedBox(height: 12),
            //? Ad
            //? zikir sınır
            //? zikir sayı=0
            //? zikir dua

            Form(
              key: _formKey,
              child: Container(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          width: 300,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.blue)),
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
                          width: 150,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.blue)),
                                icon: Icon(Icons.vibration),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.blue)),
                                icon: Icon(Icons.check),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          icon: Icon(Icons.text_snippet_sharp),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1)),
                        ),
                      ),
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
    );
  }
}
