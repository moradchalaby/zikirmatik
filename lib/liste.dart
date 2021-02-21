import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:responsive_screen/responsive_screen.dart';

import 'package:zikirmatik/yenikayit.dart';
import 'package:zikirmatik/zikirsayfa.dart';

class Listeler extends StatefulWidget {
  const Listeler({Key key, this.themecolor, this.writecolor}) : super(key: key);
  final Color themecolor;
  final Color writecolor;

  @override
  _ListelerState createState() => _ListelerState();
}

class _ListelerState extends State<Listeler> {
  Box zikirler;
  @override
  void initState() {
    zikirler = Hive.box('Zikirler');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp; //specify hp
    print(zikirler.isEmpty);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: wp(80),
            height: hp(5),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: wp(10),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.list,
                    color: Colors.white,
                    size: wp(10),
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
            height: MediaQuery.of(context).size.width,
            width: wp(80),
            child: zikirler.isNotEmpty
                ? ListView.builder(
                    itemCount: zikirler.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildName(
                          themecolor: widget.themecolor,
                          writecolor: widget.writecolor,
                          zikirmap: zikirler.getAt(index),
                          zikirbox: zikirler,
                          index: index,
                          context: context);
                    },
                  )
                : Icon(
                    Icons.do_disturb_alt_sharp,
                    size: 132,
                    color: Colors.red,
                  ),
            /* else {
                  
                } */
          ),
          Container(
            transform: Matrix4.translationValues(0.0, 0.0, 0.0),
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue,
            ),
            child: FloatingActionButton(
              onPressed: () {
                showDialog(context: context, builder: (context) => YeniKayit());
              },
              mini: true,
              child: Icon(
                Icons.add,
                color: Colors.blue,
              ),
              backgroundColor: widget.writecolor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildName(
      {Color themecolor = Colors.white,
      Color writecolor = Colors.black87,
      Map zikirmap,
      Box zikirbox,
      int index,
      BuildContext context}) {
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp;
    print(zikirmap);
    int zikirSayi = zikirmap['zikirsayac'];
    int zikirSinir = zikirmap['dongu']; //specify hp
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.5),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: hp(0.05),
          ),
          Container(height: hp(0.1), color: writecolor),
          SizedBox(height: hp(0.05)),
          Container(
            width: wp(100),
            height: hp(10),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => ZikirSayfa(
                          zikirindex: index,
                        )));
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 0,
                    child: CircleAvatar(
                      backgroundColor: writecolor,
                      radius: 45,
                      child: Column(
                        children: [
                          SizedBox(
                            height: hp(3),
                          ),
                          Text(
                            "${zikirSayi}/${zikirSinir}",
                            style:
                                TextStyle(color: Colors.white, fontSize: wp(3)),
                          ),
                          Icon(
                            Icons.double_arrow_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      zikirmap == null ? 'yok' : zikirmap['baslik'].toString(),
                      style: TextStyle(
                        color: writecolor,
                        fontWeight: FontWeight.bold,
                        fontSize: wp(5),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          zikirbox.deleteAt(index);
                        });

                        print(zikirbox.length);
                      },
                      mini: true,
                      child: Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.red[900],
                      ),
                      backgroundColor: writecolor,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: FloatingActionButton(
                      onPressed: () {},
                      mini: true,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue[900],
                      ),
                      backgroundColor: writecolor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
