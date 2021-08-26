import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_15_navigation_lamp_color/message.dart';

//controller.dart는 받는 애 (수정화면)
class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  bool _switch = true; // 앞에 화면이 켜있으므로 얘의 초기값도 true
  bool _switchPink = false;
  String switchOnOffText = "On";
  String switchYellowPinkText = "Pink";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //스위치 -> 앞에 스위치가 켜져있으면, 꺼져있으면에 따라 같이 움직이기
    if (Message.lampStatus) {
      setState(() {
        _switch = true;
        switchOnOffText = 'On';
      });
    } else {
      setState(() {
        _switch = false;
        switchOnOffText = 'Off';
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
              print('Go Main');
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        switchYellowPinkText,
                        textAlign: TextAlign.start,
                      ),
                      width: 55,
                    ),
                    CupertinoSwitch(
                        value: _switchPink,
                        onChanged: (value) {
                          setState(() {
                            _switchPink = value;
                            decisionYellowPink();
                          });
                        }),
                  ],
                ),
                width: 300,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        switchOnOffText,
                        textAlign: TextAlign.start,
                      ),
                      width: 55,
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
        switchOnOffText = "On";
      } else {
        Message.lampStatus = false;
        switchOnOffText = "Off";
      }
    });
  }

  void decisionYellowPink() {
    setState(() {
      if (_switchPink) {
        Message.lampPink = true;
        switchYellowPinkText = "Pink";
      } else {
        Message.lampPink = false;
        switchYellowPinkText = "Yellow";
      }
    });
  }
}//<-----
