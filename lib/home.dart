import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class home extends StatefulWidget {
  // const home({Key? key}) : super(key: key);
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  bool _loading = true;
  File? _image;
  List? _output;

  final picker = ImagePicker();

  @override
  void initState(){
    super.initState();
    loadModel().then((value){
      setState(() {

      });
    });
  }

  //*************image Detect function**************//
  detectImage(File image) async{
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5
    );
    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel () async{
    await Tflite.loadModel(
        model: "assets/model.tflite",
        labels: "assets/labels.txt"
        // numThreads: 0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  //**************capture************//
  pickImage() async{
    var image = await picker.getImage(source: ImageSource.camera);
    if(image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    detectImage(_image!);
  }

  //************Gallery Image**************//
  pickGalleryImage() async{
    var image = await picker.getImage(source: ImageSource.gallery);
    if(image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    detectImage(_image!);
  }



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
                  children:<Widget> [
                    Image.asset('images/logo.png'),
                    SizedBox(height: 20.0,),
                  ],
                ),
              ) : Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 250.0,
                      child: Image.file(_image!),
                    ),
                    SizedBox(height: 20.0,),
                    _output != null ? Text(
                      '${_output![0]['label']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ): Container(),
                    SizedBox(height: 10.0,),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      pickImage();
                    },
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
                    onTap: (){
                      pickGalleryImage();
                    },
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
