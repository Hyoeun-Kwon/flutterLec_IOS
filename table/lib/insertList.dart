import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  _InsertListState createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  TextEditingController? _messageBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageBox = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            previousPageTitle: 'Main View',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text('Add View'),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: CupertinoTextField(
                  controller: _messageBox,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                ),
                width: 300,
              ),
              CupertinoButton(
                  child: Text('Add'),
                  onPressed: () {
                    //add누르면 list에 추가 X, static에 넣어주기
                    setState(() {
                      addList(); //함수
                      Navigator.pop(context);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }

  void addList() {
    setState(() {
      Message.insertImagePath = 'images/pencil.png'; //예제는 이미지 하나로 지정
      Message.insertData = _messageBox!.text.toString();
    });
  }
}//<<<<<<<
