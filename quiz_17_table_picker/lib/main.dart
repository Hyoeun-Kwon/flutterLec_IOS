import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detailList.dart';
import 'insertList.dart';
import 'message.dart';
import 'todoList.dart';

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
  late List<TodoList> todoList = []; // 값이 있어서 late 안써도 되긴 함
  List _imageName = [
    'images/cart.png',
    'images/clock.png',
    'images/pencil.png'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //생성자를 통해 값 넣기 -각 줄
    todoList.add(TodoList(imagePath: _imageName[0], workList: '책구매'));
    todoList.add(TodoList(imagePath: _imageName[1], workList: '철수와 약속'));
    todoList.add(TodoList(imagePath: _imageName[2], workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Main View'),
        trailing: Material(
          child: IconButton(
              onPressed: () {
                // + 버튼 눌렀을때 다음 화면 나와야 함
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return InsertList();
                  //context를 가지고 InsertList라는 다음화면 class로 갈거야
                  // => 는  (){} 와 동일
                  //then - 갔다 온다면 rebuildData라는 함수를 실행할거야
                })).then((value) => rebuildData());
              },
              icon: Icon(Icons.add)),
        ),
      ),
      //네비 아래 화면 구성
      child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            //화면부터 보기
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //card위에 제스처 추가 -> tab을 사용 가능
                child: GestureDetector(
                  child: Card(
                    child: Column(
                      // 각 한줄을 컬럼
                      children: [
                        //셀디자인
                        Row(
                          children: [
                            Image.asset(
                              todoList[index].imagePath,
                              fit: BoxFit.contain,
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            //옛날에는 icon과 글 옆을 누르면 안됐음 그럴땐 Expanded를 썻음! (글부분을 끝까지 확장)
                            //현재는 안써도 OK
                            Expanded(child: Text(todoList[index].workList))
                          ],
                        )
                      ],
                    ),
                  ),
                  //gestureDetector의 onTap
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailList(
                        rcontentList: todoList[index].workList.toString(),
                        rimagePath: todoList[index].imagePath.toString(),
                      );
                    }));
                  },
                ),
                height: 50,
              ),
            );
          }),
    );
  }

  //갔다 왔을때 arrayList(현재: todoList)에 데이터를 추가
  //insertList에서는 리스트에 추가 안하고 static에 값만 넣을 거임
  void rebuildData() {
    setState(() {
      todoList.add(TodoList(
          imagePath: Message.insertImagePath, workList: Message.insertData));
    });
  }
} // <------
