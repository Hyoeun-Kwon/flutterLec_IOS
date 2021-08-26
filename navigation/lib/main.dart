import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/controller.dart';
import 'package:navigation/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
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
  //text 하나 받을거임
  TextEditingController? _messageBox;
  String _lampImage = 'images/lamp_on.png';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageBox = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      //CupertinoApp 을 먼저 사용안하고 PageScaffold 를 먼저 사용해줘야 네비게이션 바를 사용할 수 있음 (locations 같은거 사용시엔 App 필요)
      navigationBar: CupertinoNavigationBar(
        leading: Material(
          child: IconButton(
              onPressed: () {
                //그냥 홈 만들어 둔거라 할거 없음!
                print('Home button is clicked');
              },
              icon: Icon(Icons.home)),
        ),
        middle: Text(
          'Main 화면',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Material(
          child: IconButton(
              onPressed: () {
                //눌렀을때 화면 넘어감! - class로 만든 message
                Message.contents =
                    _messageBox!.text; //textfield에 적은 값을 클라스에 만든 contents에 넣음
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return Controller(); // class로 만듬!
                  //then: 갔다 왔을때
                  //getData : static 에 있는 값
                })).then((value) => getData());
              },
              icon: Icon(Icons.edit)),
        ),
      ),
      //네비
      //밑에 있는 화면 구성
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //container를 텍스트와 텍스트필드에 둘다 동일하게 줘서 정렬 맞춤
              child: Text(
                'Message',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //container 폭
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: CupertinoTextField(
                controller: _messageBox,
                maxLines: 1,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.text,
                placeholder: 'Message를 입력하세요',
              ),
              //container 폭
              width: 300,
            ),
            Image.asset(
              _lampImage,
              width: 150,
              height: 300,
            )
          ],
        ),
      ),
    );
  }

  void getData() {
    //class에 있는게 ~ 이면 이렇게 띄워줘
    _messageBox!.text = Message.contents;
    if (Message.lampStatus == true) {
      setState(() {
        _lampImage = 'images/lamp_on.png';
      });
    } else {
      setState(() {
        _lampImage = 'images/lamp_off.png';
      });
    }
  }
} // <<<<
