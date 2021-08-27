import 'package:collection_view_image/detailImage.dart';
import 'package:collection_view_image/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  //Bean 이 따로 없으므로 generic은 String
  late List<String> imageList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //맨처음 리스트 보여줘야 하므로 데이터 몇개 있어야 함
    imageList.add('images/flower_01.png');
    imageList.add('images/flower_02.png');
    imageList.add('images/flower_03.png');
    imageList.add('images/flower_04.png');
    imageList.add('images/flower_05.png');
    imageList.add('images/flower_06.png');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Main View'),
      ),
      child: GridView.builder(
        itemCount: imageList.length,
        //gridDelegate 가 중요! : 화면에 어떻게 만들지 결정
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //3개씩 만들거야! (한줄)
          crossAxisSpacing: 10, // 가로
          mainAxisSpacing: 10, // 세로
        ),
        //itemBuilder에서 카드 만들고 하는 것임
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              color: Colors.green[200],
              //클릭시 뭐 할거야! : GestureDetector
              child: GestureDetector(
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        '${imageList[index]}',
                        fit: BoxFit.contain,
                        width: 150,
                        height: 150,
                      )
                    ],
                  ),
                  //card의 color
                  color: Colors.green[100],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailImage(
                        rcontentList: imageList[index].toString());
                  }));
                },
              ),
            ),
          );
        },
      ),
    );
  }

  //입력후 갔다와서 실행할 함수
  //갔다 왔을때 arrayList(현재: todoList)에 데이터를 추가
  //insertList에서는 리스트에 추가 안하고 static에 값만 넣을 거임
  void rebuildData() {
    setState(() {
      if (Message.imageName == "" || Message.imageName.isEmpty) {
        print('Error');
      } else {
        imageList.add(Message.imageName);
      }
    });
  }
}// <<<<<
