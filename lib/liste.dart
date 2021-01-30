import 'package:flutter/material.dart';
import 'package:zikirmatik/yenikayit.dart';

class Listeler extends StatelessWidget {
  const Listeler({Key key, this.themecolor, this.writecolor}) : super(key: key);
  final Color themecolor;
  final Color writecolor;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 325,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.list,
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
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(39)),
            height: 400.0,
            width: 360.0,
            child: ListView(
              children: <Widget>[
                _buildName(
                    themecolor: themecolor,
                    writecolor: writecolor,
                    zikirAdi: "Zikir 1",
                    zikirSayi: 25,
                    zikirSinir: 111),
                _buildName(
                    themecolor: themecolor,
                    writecolor: writecolor,
                    zikirAdi: "Zikir 2",
                    zikirSayi: 325,
                    zikirSinir: 1452),
                _buildName(
                    themecolor: themecolor,
                    writecolor: writecolor,
                    zikirAdi: "Zikir 3",
                    zikirSayi: 15,
                    zikirSinir: 33),
                _buildName(
                    themecolor: themecolor,
                    writecolor: writecolor,
                    zikirAdi: "Zikir 4",
                    zikirSayi: 125,
                    zikirSinir: 333),
                _buildName(
                    themecolor: themecolor,
                    writecolor: writecolor,
                    zikirAdi: "Zikir 4",
                    zikirSayi: 125,
                    zikirSinir: 333),
                _buildName(
                    themecolor: themecolor,
                    writecolor: writecolor,
                    zikirAdi: "Zikir 4",
                    zikirSayi: 125,
                    zikirSinir: 333),
                _buildName(
                    themecolor: themecolor,
                    writecolor: writecolor,
                    zikirAdi: "Zikir 4",
                    zikirSayi: 125,
                    zikirSinir: 333),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Container(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue,
              ),
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (context) => Yenikayit());
                },
                mini: true,
                child: Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                backgroundColor: writecolor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildName(
    {Color themecolor = Colors.white,
    Color writecolor = Colors.black87,
    String zikirAdi,
    int zikirSayi,
    int zikirSinir}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.5),
    child: Column(
      children: <Widget>[
        SizedBox(height: 5),
        Container(height: 1, color: writecolor),
        SizedBox(height: 5),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: CircleAvatar(
                backgroundColor: writecolor,
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
                      Icons.double_arrow_rounded,
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
            SizedBox(width: 10),
            Text(
              zikirAdi,
              style: TextStyle(
                color: writecolor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              mini: true,
              child: Icon(
                Icons.delete_forever_outlined,
                color: Colors.red[900],
              ),
              backgroundColor: writecolor,
            ),
            FloatingActionButton(
              mini: true,
              child: Icon(
                Icons.edit,
                color: Colors.blue[900],
              ),
              backgroundColor: writecolor,
            ),
          ],
        ),
      ],
    ),
  );
}
