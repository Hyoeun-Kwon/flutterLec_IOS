import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  //처음 램프이미지 켜져있고, 크기는 작고 버튼은 이미지 확대, 전구스위치는 켜져있음
  String _lampImage = 'images/lamp_on.png'; // 이미지는 켜있는 이미지
  double _lampWidth = 150; // 램프 초기 가로 크기
  double _lampHeight = 300; // 램프 초기 세로 크기
  String _buttonName = "Image 확대"; // 버튼 이름
  String _lampSizeStatus = 'small'; // 램프 사이즈 초기 상태: 작음
  bool _switch = true; //스위치 켜있다.

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: [
            //Container :  화면에서 frame 잡아주는 것과 같다. : 위의 이미지가 커지든 작아지든 아래 위치가 동일
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
              //container 크기
              width: 350,
              height: 650,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                    child: Text(_buttonName),
                    onPressed: () {
                      setState(() {
                        decisionLampSize();
                      });
                    }),
                Column(
                  children: [
                    Text('전구 스위치',
                        style: TextStyle(
                          fontSize: 12.0,
                        )),
                    CupertinoSwitch(
                        value: _switch, //켜있다.
                        onChanged: (value) {
                          setState(() {
                            _switch = value; // 켜졌다. 꺼졋다의 상태
                            decisionOnOff();
                          });
                        }),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  //setState 사용
  void decisionLampSize() {
    if (_lampSizeStatus == "small") {
      //size 상태를 large로
      _lampSizeStatus = "large";
      //작았으니 크게 하자
      _lampWidth = 300;
      _lampHeight = 600;
      // 이미지가 커졌으니 축소 버튼으로 변경
      _buttonName = "Image 축소";
    } else {
      //위와 반대로
      _lampSizeStatus = "small";
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonName = "Image 확대";
    }
  } //decisionLampSize

  void decisionOnOff() {
    if (_switch) {
      _lampImage = "images/lamp_on.png";
    } else {
      _lampImage = "images/lamp_off.png";
    }
  } //decisionOnOff
} // < ------
