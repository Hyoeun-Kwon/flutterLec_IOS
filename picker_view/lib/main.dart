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
  List _imageName = [
    'w1.jpg',
    'w2.jpg',
    'w3.jpg',
    'w4.jpg',
    'w5.jpg',
    'w6.jpg',
    'w7.jpg',
    'w8.jpg',
    'w9.jpg',
    'w10.jpg',
  ];

  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Picker View로 이미지 선택',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Container(
                child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 30, //picker내에 글자 보이는 범위
                    scrollController:
                        FixedExtentScrollController(initialItem: 0),
                    onSelectedItemChanged: (value) {
                      //value라는 명은 별로 의미 없음
                      //data 모양이 바뀌면
                      setState(() {
                        _selectedItem = value;
                      });
                    },
                    //picker에 보이는 데이터 이름들
                    children: [
                      Text(_imageName[0]),
                      Text(_imageName[1]),
                      Text(_imageName[2]),
                      Text(_imageName[3]),
                      Text(_imageName[4]),
                      Text(_imageName[5]),
                      Text(_imageName[6]),
                      Text(_imageName[7]),
                      Text(_imageName[8]),
                      Text(_imageName[9]),
                    ]),
                //container 크기
                width: 300,
                height: 250,
              ),
              Text('Selected Item : ${_imageName[_selectedItem]}'),
              //그림
              Container(
                //container에는 children 불가
                child: Image.asset(
                  'images/${_imageName[_selectedItem]}',
                  fit: BoxFit.contain,
                  width: 300,
                  height: 500,
                ),
                //container 크기 // 이미지 크기가 더 커도 컨테이너에 맞춰줌
                width: 300,
                height: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
} //------
