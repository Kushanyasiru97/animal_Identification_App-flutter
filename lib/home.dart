// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  // const home({Key? key}) : super(key: key);
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.0,),
            Text(
              'Kushan Yasiru',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Animal Classification',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 50.0,),
            Center(
              child: _loading ? Container(
                width: 450.0,
                child: Column(
                  children: [
                    Image.asset('images/logo.png'),
                    SizedBox(height: 20.0,),
                  ],
                ),
              ) : Container(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 100.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Text(
                        'Capture a Image',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 100.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Text(
                        'Import a Image',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
