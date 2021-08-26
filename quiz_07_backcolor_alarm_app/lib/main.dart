import 'package:quiz_07/zeroFormat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';

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
  String currentDateTime = "";
  bool _isRunning = true;
  ZeroFormat zero = ZeroFormat();
  DateTime? chosenDateTime;
  dynamic backgroundColor;
  bool _isTimerOn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (!_isRunning) {
        timer.cancel();
      }
      _addItem();
      _colorChange();
    });
  }

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
        backgroundColor: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "현재시간 : " + currentDateTime,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    use24hFormat: true,
                    onDateTimeChanged: (value) {
                      chosenDateTime = value;
                      // _isTimerOn = false;
                      // _colorChange();
                    },
                  ),
                  width: 300,
                  height: 200,
                ),
              ),
              Text(
                "선택시간 : ${chosenDateTime != null ? _chosenItem(chosenDateTime!) : "시간을 선택하세요"}",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addItem() {
    final DateTime now = DateTime.now();
    setState(() {
      currentDateTime =
          ("${now.year}-${zero.monthZero(now.month)}-${zero.dayZero(now.day)} ${_weekdayToString(now.weekday)} ${zero.hourZero(now.hour)}:${zero.minZero(now.minute)}:${zero.secZero(now.second)}");
    });
  }

  void _colorChange() {
    final DateTime now = DateTime.now();
    setState(() {
      if (chosenDateTime!.minute == now.minute) {
        _isTimerOn = true;
      } else {
        _isTimerOn = false;
      }

      if (_isTimerOn) {
        if (now.second % 2 == 1) {
          backgroundColor = Colors.amber;
        } else {
          backgroundColor = Colors.pink[400];
        }
      } else {
        backgroundColor = null;
      }
    });
  }

  String _chosenItem(DateTime now) {
    String chosenDateTime = "";
    setState(() {
      chosenDateTime =
          ("${now.year}-${zero.monthZero(now.month)}-${zero.dayZero(now.day)} ${_weekdayToString(now.weekday)} ${zero.hourZero(now.hour)}:${zero.minZero(now.minute)}:${zero.secZero(now.second)}");
    });

    return chosenDateTime;
  }

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
    }
    return dateName;
  }
}
