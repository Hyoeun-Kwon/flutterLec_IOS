import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailImage extends StatefulWidget {
  final String rcontentList;

  const DetailImage({Key? key, required this.rcontentList}) : super(key: key);

  @override
  _DetailImageState createState() => _DetailImageState(rcontentList);
}

class _DetailImageState extends State<DetailImage> {
  //Create Constructor ----
  late String contentList; // 이 변수에 rcontentList를 담을거야

  _DetailImageState(String rcontentList) {
    this.contentList = rcontentList;
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoPageScaffold(
            //네비게이션 바
            navigationBar: CupertinoNavigationBar(
              leading: CupertinoNavigationBarBackButton(
                // '<' 모양
                previousPageTitle: 'Main View',
                onPressed: () {
                  //할게없음, 빠지면 됨
                  Navigator.pop(context);
                },
              ),
              middle: Text('Detail View'),
            ),
            //밑 화면 구성
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(contentList),
                    ),
                  ]),
            )));
  }
}
