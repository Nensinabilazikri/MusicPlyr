import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'listscreen.dart';

class   SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 175, 205, 1.0),
      body: Center(
     
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.bottomRight,
        //         end: Alignment.topRight,
        //         colors: [Color.fromRGBO(217, 175, 205, 1.0),
        //         Color.fromRGBO(207, 115, 235, 1.0)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/test1.png',
              width: 180.0,
              height: 180.0,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 10, bottom: 20, left: 10)),
            Text(
              'Music Player',
              style: TextStyle(
                  color: Color(0XFFFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'ChampagneLimousines'),
            ),
            SizedBox(
              height: 10.0,
            ),
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Versi ',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
              TextSpan(
                  text: '1.0 ',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontStyle: FontStyle.italic)),
            ]))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); //inisialisasi

    startSplashScreenDelay();
  }

  startSplashScreenDelay() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, pindahListScreen);
  }
  void pindahListScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return ListScreen();
    }));
  }
}
