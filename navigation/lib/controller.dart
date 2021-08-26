import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/message.dart';

//controller.dart는 받는 애 (수정화면)
class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  //텍스트필드와 스위치
  TextEditingController? _messageBox;
  bool _switch = true; // 앞에 화면이 켜있으므로 얘의 초기값도 true
  String switchText = "On";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageBox = TextEditingController();
    _messageBox!.text = Message.contents; // 앞에서 입력한것 -> 클래스 -> 이곳 텍스트필드에 띄워짐

    //스위치 -> 앞에 스위치가 켜져있으면, 꺼져있으면에 따라 같이 움직이기
    if (Message.lampStatus) {
      setState(() {
        _switch = true;
        switchText = 'On';
      });
    } else {
      setState(() {
        _switch = false;
        switchText = 'Off';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        //controller 구성
        navigationBar: CupertinoNavigationBar(
          // <Main화면 (뒤로가기) 쓰고싶지않으면 안쓰면 됨!
          leading: CupertinoNavigationBarBackButton(
            previousPageTitle: 'Main 화면',
            onPressed: () {
              //눌렀을때 _ 작성된 메세지를 가지고 넘긴뒤 사라지기
              Message.contents = _messageBox!.text;
              Navigator.pop(context);
            },
          ),
          middle: Text('수정화면'),
        ),
        //------ 네비
        //화면구성
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: CupertinoTextField(
                  controller: _messageBox,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                ),
                width: 300,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(switchText),
                    SizedBox(
                      width: 10,
                    ),
                    CupertinoSwitch(
                        value: _switch,
                        onChanged: (value) {
                          setState(() {
                            _switch = value;
                            decisionOnOff();
                          });
                        }),
                  ],
                ),
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void decisionOnOff() {
    setState(() {
      if (_switch) {
        Message.lampStatus = true;
        switchText = "On";
      } else {
        Message.lampStatus = false;
        switchText = "Off";
      }
    });
  }
}//<-----
