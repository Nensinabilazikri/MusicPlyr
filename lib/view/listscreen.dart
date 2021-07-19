import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer_nensi/models/musicplay.dart';
import 'package:http/http.dart' as http;
import 'package:musicplayer_nensi/view/result.dart';
import 'package:musicplayer_nensi/viewmodels/sharedpref.dart';

class ListScreen extends StatefulWidget {
  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<StatefulWidget> {
  @override
  TextEditingController _keywordPencarian = new TextEditingController();
  List allSong = [];
  List filterSong = [];
  List name = [];
  List songName = [];
  List pic = [];
  List link = [];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(217, 175, 205, 1.0),
        body: Center(
          child: Column(children: [
            SizedBox(height: 100),
            Text(
              'Find your music!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 90),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(60, 10, 20, 10),
                  child: Container(
                      height: 35,
                      width: 210,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white10),
                      )),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: KeyWord(),
                      )),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        SharePreferencesHelper.saveName(_keywordPencarian.text);
                      });
                      //SharePreferencesHelper.saveName(_keywordPencarian.text);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return ResultScreen();
                      }));
                    },
                    icon: Icon(Icons.search_outlined)),
              ],
            ),
          ]),
        ));
  }

  Widget KeyWord() {
    return TextField(
      controller: _keywordPencarian,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      onChanged: (value) {
        SharePreferencesHelper.saveName(_keywordPencarian.text);
      },
    );
  }
}
