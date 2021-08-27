import 'package:collection_view_label/detailHero.dart';
import 'package:collection_view_label/insertHero.dart';
import 'package:collection_view_label/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  //Bean 이 따로 없으므로 generic은 String
  late List<String> heroList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //맨처음 리스트 보여줘야 하므로 데이터 몇개 있어야 함
    heroList.add('유비');
    heroList.add('관우');
    heroList.add('조조');
    heroList.add('장비');
    heroList.add('여포');
    heroList.add('초선');
    heroList.add('손견');
    heroList.add('장양');
    heroList.add('손책');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('삼국지 인물'),
        trailing: Material(
          child: IconButton(
            onPressed: () {
              //add 버튼
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return InsertHero();
              })).then((value) => rebuildData());
            },
            icon: Icon(Icons.add),
          ),
        ),
      ),
      child: GridView.builder(
        itemCount: heroList.length,
        //gridDelegate 가 중요! : 화면에 어떻게 만들지 결정
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //3개씩 만들거야! (한줄)
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        //itemBuilder에서 카드 만들고 하는 것임
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              color: Colors.blue[200],
              //클릭시 뭐 할거야! : GestureDetector
              child: GestureDetector(
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        heroList[index],
                        style: TextStyle(
                            fontSize: 18, color: Colors.blueGrey[700]),
                      )
                    ],
                  ),
                  //card의 color
                  color: Colors.blue[100],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailHero(rcontentList: heroList[index].toString());
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
      if (Message.humanName == "" || Message.humanName.isEmpty) {
        print('Error');
      } else {
        heroList.add(Message.humanName);
      }
    });
  }
}// <<<<<
