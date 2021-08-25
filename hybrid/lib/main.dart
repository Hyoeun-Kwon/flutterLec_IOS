import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //웹뷰를 위한 컨트롤러 -> 패키지 필요 yaml 작업
  final Completer<WebViewController> _webController =
      Completer<WebViewController>();
  //indicator 가 웹뷰가 뜬상탠지 아닌지 알아야 하기 때문
  bool isLoading = true; // for indicator

  // --------------------------state : webViewController, loading 상태

  //검색 부분 textField
  final searchContoller = TextEditingController();

  //검색한 값 입력받는 url
  String url = 'https://www.daum.net';

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            children: [
              Container(
                //검색부분 컨테이너

              ),
              Container(
                //webview
              ),
              persistentFooterButtons: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.stop),
                color: Colors.blue,
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {
                  _webViewController!.reload();
                },
                icon: Icon(Icons.replay),
                color: Colors.blue,
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {
                  _webViewController!.goBack();
                },
                icon: Icon(Icons.fast_rewind),
                color: Colors.blue,
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {
                  _webViewController!.goForward();
                },
                icon: Icon(Icons.fast_forward),
                color: Colors.blue,
              ),
            ],
          ),
        )
      ],
      backgroundColor: Colors.amber[50],
    );

            ],
          ),
        ),
      )
    );
  }
}

