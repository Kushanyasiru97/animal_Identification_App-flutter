import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';

class mySplash extends StatefulWidget {
  const mySplash({Key? key}) : super(key: key);

  @override
  _mySplashState createState() => _mySplashState();
}

class _mySplashState extends State<mySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: home(),
      title: Text(
        'Animal Classification',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.lightGreenAccent,
        )
      ),
      image: Image.asset('images/logo.png'),
      backgroundColor: Colors.blue,
      photoSize: 80.0,
      loaderColor: Colors.green,
    );
  }
}
