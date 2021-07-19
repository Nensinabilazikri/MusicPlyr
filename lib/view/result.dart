import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer_nensi/models/musicplay.dart';
import 'package:http/http.dart' as http;
import 'package:musicplayer_nensi/viewmodels/sharedpref.dart';

import 'controller.dart';

class ResultScreen extends StatefulWidget {
  @override
  ResultScreenState createState() => ResultScreenState();
}

class ResultScreenState extends State<StatefulWidget> {
  @override
  //TextEditingController _keywordPencarian = new TextEditingController();
  List allSong = [];
  String linknya = '';
  List filterSong = [];
  List name = [];
  List songName = [];
  List pic = [];
  List link = [];
  String kata = '';
  //manual cek
  List name2 = ["Ariana Grande", "Ariana Grande"];
  List songName2 = ["Problem (feat. Iggy Azalea)", "Dangerous Woman"];
  List pic2 = [
    "https://is4-ssl.mzstatic.com/image/thumb/Music115/v4/1b/d3/57/1bd357cd-2fc8-e597-7392-1b5417fb0558/source/60x60bb.jpg",
    "https://is4-ssl.mzstatic.com/image/thumb/Music125/v4/1c/c0/f1/1cc0f109-f03a-b467-843e-a06e0171ba6b/source/60x60bb.jpg"
  ];
  List link2 = [
    "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/de/8e/7f/de8e7f54-84e8-ed55-c4ef-0e995a52917b/mzaf_15831241423470069809.plus.aac.p.m4a",
    "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/1d/ed/2c/1ded2c25-caf2-8af5-8966-55a0664e731e/mzaf_3120711765956613593.plus.aac.p.m4a"
  ];

  void initState() {
    super.initState();
    setState(() {
      SharePreferencesHelper.readName().then((value) {
        kata = value;
        getSong();
        print(kata);
      });
    });
  }

  //API
  Future<MusicPlayModel> getSong() async {
    var res = await http.get(
      Uri.parse(
          "https://itunes.apple.com/search?term=${kata}&entity=musicTrack"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    MusicPlayModel data = musicPlayModelFromJson(res.body);

    setState(() {
      allSong = data.results;
      data.results.map((e) {
        name.add(e.artistName);
        songName.add(e.trackName);
        link.add(e.trackViewUrl);
        pic.add(e.artworkUrl60);
        //save link
      });
      // for (int i = 0; i <= data.results.length; i++) {
      //   linknya = linknya + "/" + link[i];
      //   SharePreferencesHelper.saveLink(linknya);
      // }
      // for (int i = 0; i <= allSong.length; i++) {
      //   name.add(allSong[i]['artistName']);
      //   songName.add(allSong[i]['trackName']);
      //   link.add(allSong[i]['trackViewUrl']);
      //   pic.add(allSong[i]['artworkUrl60']);
      // }
      print("nama: $name\n judul: $songName\n link: $link");
    });

    return data;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Playlist',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black38),
        ),
      ),
      body: Column(
        children: [listSong(), 
        // Expanded(child: PlayerControls())
        ],
      ),
    );
  }

  Widget listSong() {
    return name.isNotEmpty
        ? ListView.builder(
            itemCount: name.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 80,
                width: 300,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(15, 15, 5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      child: Image.network(
                                        pic[index].toString(),
                                        fit: BoxFit.cover,
                                        width: 40,
                                        height: 40,
                                      )),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    songName[index].toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue),
                                  ),
                                  Text(
                                    name[index].toString(),
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.lightBlue),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text("Loading")
            ],
          ));
  }
}
