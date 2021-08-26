import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fileName = [
    'flower_01.png',
    'flower_02.png',
    'flower_03.png',
    'flower_04.png',
    'flower_05.png',
    'flower_06.png'
  ];
  int fileIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      // if (!_isRunning) {
      //   timer.cancel();
      // }
      // _addItem();
      // _colorChange();
      _changeImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '3초마다 이미지 무한 변경 무한반복',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                fileName[fileIndex],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'images/${fileName[fileIndex]}',
                width: 300,
                height: 600,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CupertinoButton(
              //       child: Text('이전'),
              //       onPressed: (){
              //         setState(() {
              //           if (fileIndex == 0) {
              //             fileIndex = 5;
              //           } else {
              //             fileIndex --;
              //           }
              //         });
              //       },
              //     ),
              //     CupertinoButton(
              //       child: Text('다음'),
              //       onPressed: (){
              //         setState(() {
              //           if (fileIndex == 5) {
              //             fileIndex = 0;
              //           } else {
              //           fileIndex ++;
              //          }
              //         });
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeImage() {
    setState(() {
      if (fileIndex == 5) {
        fileIndex = 0;
      } else {
        fileIndex++;
      }
    });
  }
}
