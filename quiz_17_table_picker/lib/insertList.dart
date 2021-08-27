import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  _InsertListState createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  TextEditingController? _messageBox;
  List _imageName = [
    'images/cart.png',
    'images/clock.png',
    'images/pencil.png'
  ];
  int _selectedItem = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageBox = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            previousPageTitle: 'Main View',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text('Add View'),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  children: [
                    Image.asset(
                      '${_imageName[_selectedItem]}',
                      fit: BoxFit.contain,
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(
                      width: 20,
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
                            Image.asset(
                              _imageName[0],
                            ),
                            Image.asset(
                              _imageName[1],
                            ),
                            Image.asset(
                              _imageName[2],
                            )
                          ]),
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              ),
              Container(
                child: CupertinoTextField(
                  controller: _messageBox,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                ),
                width: 300,
              ),
              CupertinoButton(
                  child: Text('Add'),
                  onPressed: () {
                    //add누르면 list에 추가 X, static에 넣어주기
                    setState(() {
                      addList(); //함수
                      Navigator.pop(context);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }

  void addList() {
    setState(() {
      Message.insertImagePath = '${_imageName[_selectedItem]}'; //예제는 이미지 하나로 지정
      Message.insertData = _messageBox!.text.toString();
    });
  }

  void _showAlert({String? title, String? message}) {
    showCupertinoDialog(
        // context 현재 화면의 상태 정보 메모리 위치 등을 알고 있음
        context: context,
        builder: (context) {
          //build할때도 context로 만듬
          return CupertinoAlertDialog(
            title: Text(title!),
            content: Text(message!),
            actions: [
              CupertinoDialogAction(
                //ios 에서의 material 과 같음
                isDefaultAction: true,
                child: Text('네 알겠습니다.'),
                onPressed: () {
                  print('Alert: Action Default');
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  } //_showAlert
} //<<<<<<<
