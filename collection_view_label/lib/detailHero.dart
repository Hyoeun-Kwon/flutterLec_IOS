import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailHero extends StatefulWidget {
  final String rcontentList;
  const DetailHero({Key? key, required this.rcontentList}) : super(key: key);

  @override
  _DetailHeroState createState() => _DetailHeroState(rcontentList);
}

class _DetailHeroState extends State<DetailHero> {
  //Create Constructor ----
  late String contentList; // 이 변수에 rcontentList를 담을거야

  _DetailHeroState(String rcontentList) {
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
              middle: Text('인물 보기'),
            ),
            //밑 화면 구성
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(contentList),
                  ]),
            )));
  }
}
