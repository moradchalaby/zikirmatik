import 'package:flutter/material.dart';

Widget listeler() {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    elevation: 16,
    child: Container(
      height: 400.0,
      width: 360.0,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Liste",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          mini: true,
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          _buildName(
              zikirRenk: Colors.amber,
              zikirAdi: "Zikir 1",
              zikirSayi: 25,
              zikirSinir: 111),
          _buildName(
              zikirRenk: Colors.blue,
              zikirAdi: "Zikir 2",
              zikirSayi: 325,
              zikirSinir: 1452),
          _buildName(
              zikirRenk: Colors.pink,
              zikirAdi: "Zikir 3",
              zikirSayi: 15,
              zikirSinir: 33),
          _buildName(
              zikirRenk: Colors.green,
              zikirAdi: "Zikir 4",
              zikirSayi: 125,
              zikirSinir: 333),
        ],
      ),
    ),
  );
}

Widget _buildName(
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
