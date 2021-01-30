import 'package:flutter/material.dart';

class Duzenle extends StatefulWidget {
  Duzenle({Key key}) : super(key: key);

  @override
  _DuzenleState createState() => _DuzenleState();
}

class _DuzenleState extends State<Duzenle> {
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
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )
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

/* Widget _buildName(
    {Color zikirRenk, String zikirAdi, int zikirSayi, int zikirSinir}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        SizedBox(height: 12),
        Container(height: 1, color: zikirRenk),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () => print(zikirAdi),
              child: CircleAvatar(
                backgroundColor: zikirRenk,
                radius: 45,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${zikirSayi}/${zikirSinir}",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                    )
                  ],
                ), /* FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.red[900],
                  child: Icon(Icons.delete_forever),
                ), */
              ),
            ),
            SizedBox(width: 12),
            Text(
              zikirAdi,
              style: TextStyle(color: zikirRenk),
            ),
            Spacer(),
            FloatingActionButton(
              mini: true,
              child: Icon(
                Icons.delete_forever_outlined,
              ),
              backgroundColor: Colors.red[900],
            ),
            SizedBox(width: 12),
            FloatingActionButton(
              mini: true,
              child: Icon(
                Icons.edit,
              ),
              backgroundColor: Colors.blue[900],
            ),
          ],
        ),
      ],
    ),
  );
}
 */
