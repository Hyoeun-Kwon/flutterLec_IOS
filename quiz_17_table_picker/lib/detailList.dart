import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailList extends StatefulWidget {
  //생성자 통해서 값 받아오기
  final String rcontentList;
  final String rimagePath;
  const DetailList(
      {Key? key, required this.rcontentList, required this.rimagePath})
      : super(key: key);

  @override
  _DetailListState createState() => _DetailListState(
      rcontentList, rimagePath); //rcontentList를 아래의 화면구성 class로 넘겨주기
}

//화면에 보여주는 class
class _DetailListState extends State<DetailList> {
  //Create Constructor ----
  late String contentList; // 이 변수에 rcontentList를 담을거야
  late String imageList;
  _DetailListState(String rcontentList, String rimagePath) {
    this.contentList = rcontentList;
    this.imageList = rimagePath;
  }
  //----
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
                    Image.asset(imageList),
                    SizedBox(
                      height: 10,
                    ),
                    Text(contentList),
                  ]),
            )));
  }
}
