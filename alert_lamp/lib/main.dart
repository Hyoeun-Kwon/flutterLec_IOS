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
  bool _lampOnStatus = true; // 램프 사이즈 초기 상태: 작음

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Alert',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            //Container :  화면에서 frame 잡아주는 것과 같다. : 위의 이미지가 커지든 작아지든 아래 위치가 동일
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: 300,
                    height: 600,
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
                    child: Text('켜기',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      setState(() {
                        if (_lampOnStatus == true) {
                          _lampImage = "images/lamp_on.png";
                          _showEqualAlert(title: "경고", message: "현재 On 상태입니다.");
                        } else {
                          _showOnOffAlert(title: "램프끄기", message: "램프를 끄겠습니까");
                        }
                      });
                    }),
                CupertinoButton(
                    child: Text('끄기',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      setState(() {
                        if (_lampOnStatus == true) {
                          _showOnOffAlert(title: "램프끄기", message: "램프를 끄겠습니까");
                        } else {
                          _showEqualAlert(
                              title: "경고", message: "현재 Off 상태입니다.");
                        }
                      });
                    }),
              ],
            )
          ],
        ),
      ),
    ));
  }

//모양: 딕셔너리
  void _showEqualAlert({String? title, String? message}) {
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

  void _showOnOffAlert({String? title, String? message}) {
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
                child: Text('네'),
                onPressed: () {
                  setState(() {
                    if (_lampOnStatus == true) {
                      _lampOnStatus = false;

                      _lampImage = "images/lamp_off.png";
                    } else {
                      _lampOnStatus = true;

                      _lampImage = "images/lamp_on.png";
                    }
                  });
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                //ios 에서의 material 과 같음
                isDefaultAction: true,
                child: Text('아니오'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  } //_showAlert

} // < ------
