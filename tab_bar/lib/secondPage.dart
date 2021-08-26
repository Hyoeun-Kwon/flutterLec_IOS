import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//timer를 위한
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tab_bar/zeroFormat.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //currentDateTime
  String currentDateTime = "";
  bool _isRunning = true;
  ZeroFormat zero = ZeroFormat(); //class로 만든 포맷 가져오기(시간 표시 형식)
  //데이트 피커에서 선택한 값 가져감
  DateTime? chosenDateTime;

  //앱뜨기 전 타이머 구동
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //타이머
    //1초마다 한번씩 반응한다.
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (!_isRunning) {
        //동작하지 않으면(not true)
        timer.cancel();
      }
      _addItem(); //1초에 한번씩 addItem을 구동시킨다.
    });
  } //initState

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KO'),
        const Locale('en', 'US'),
      ],
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '현재시간: ' + currentDateTime,
                style: TextStyle(fontSize: 16.0),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(), //현재시간 기중
                      use24hFormat: true,
                      onDateTimeChanged: (value) {
                        //피커 클릭시 바뀌는 값
                        chosenDateTime = value;
                      }),
                  //container 크기
                  width: 300,
                  height: 200,
                ),
              ),
              Text(
                '선택시간 : ${chosenDateTime != null ? _chosenItem(chosenDateTime!) : "시간을 선택하세요"}',
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addItem() {
    //now라는 변수에 현재 시간 넣기
    final DateTime now = DateTime.now();
    setState(() {
      //1초에 한번씩 currenDateTime에 년-월-일 요일 시:분:초 입력
      currentDateTime =
          ("${now.year}-${zero.monthZero(now.month)}-${zero.dayZero(now.day)} ${_weekdayToString(now.weekday)} ${zero.hourZero(now.hour)}:${zero.minZero(now.minute)}:${zero.secZero(now.second)}");
      //now.weekday : 2 인데 이게 화요일 이를 바꾸는 함수 필요
    });
  }

  //now.weekday : 2 -> 화요일 이를 바꾸는 함수
  String _weekdayToString(int weekday) {
    String dateName = "";
    switch (weekday) {
      case 1:
        dateName = "월";
        break;
      case 2:
        dateName = "화";
        break;
      case 3:
        dateName = "수";
        break;
      case 4:
        dateName = "목";
        break;
      case 5:
        dateName = "금";
        break;
      case 6:
        dateName = "토";
        break;
      case 7:
        dateName = "일";
        break;
    }
    return dateName;
  }

  String _chosenItem(DateTime now) {
    //이름을 now로 잡은건 복사한 값이 now여서..
    //now라는 변수에 현재 시간 넣기
    String chosenDateTime = "";
    setState(() {
      //1초에 한번씩 currenDateTime에 년-월-일 요일 시:분:초 입력
      chosenDateTime =
          ("${now.year}-${zero.monthZero(now.month)}-${zero.dayZero(now.day)} ${_weekdayToString(now.weekday)} ${zero.hourZero(now.hour)}:${zero.minZero(now.minute)}:${zero.secZero(now.second)}");
      //now.weekday : 2 인데 이게 화요일 이를 바꾸는 함수 필요
    });
    return chosenDateTime;
  }
} // <--------
