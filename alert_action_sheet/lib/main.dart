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
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Alert와 Action Sheet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                    child: Text('Alert'),
                    onPressed: () {
                      setState(() {
                        //모양 : 딕셔너리
                        _showAlert(title: "Title", message: "Message");
                      });
                    }),
                CupertinoButton(
                    child: Text('Action Sheet'),
                    onPressed: () {
                      setState(() {
                        //모양 : 딕셔너리
                        _showActionSheet(title: "Title", message: "Message");
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //모양: 딕셔너리
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
                child: Text('Action Default'),
                onPressed: () {
                  print('Alert: Action Default');
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                //ios 에서의 material 과 같음
                isDestructiveAction: true,
                child: Text('Action Destructive'),
                onPressed: () {
                  print('Alert: Action Destructive');
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                //ios 에서의 material 과 같음

                child: Text(
                  'Action Cancel',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  print('Alert: Action Cancel');
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  } //_showAlert

  //모양: 딕셔너리
  void _showActionSheet({String? title, String? message}) {
    showCupertinoModalPopup(
        // context 현재 화면의 상태 정보 메모리 위치 등을 알고 있음
        context: context,
        builder: (context) {
          //build할때도 context로 만듬
          return CupertinoActionSheet(
            title: Text(title!),
            message: Text(message!),
            actions: [
              CupertinoActionSheetAction(
                //ios 에서의 material 과 같음
                isDefaultAction: true,
                child: Text('Action Default'),
                onPressed: () {
                  print('Alert: Action Default');
                  Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                //ios 에서의 material 과 같음
                isDestructiveAction: true,
                child: Text('Action Destructive'),
                onPressed: () {
                  print('Alert: Action Destructive');
                  Navigator.pop(context);
                },
              ),
            ],
            //배열 바깥 버튼
            cancelButton: CupertinoActionSheetAction(
              //ios 에서의 material 과 같음

              child: Text(
                'Action Cancel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                print('Alert: Action Cancel');
                Navigator.pop(context);
              },
            ),
          );
        });
  } //_showActionSheet

} //-------
