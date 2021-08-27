import 'package:collection_view_label/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertHero extends StatefulWidget {
  const InsertHero({Key? key}) : super(key: key);

  @override
  _InsertHeroState createState() => _InsertHeroState();
}

class _InsertHeroState extends State<InsertHero> {
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
          middle: Text('인물 추가'),
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
      Message.humanName = _messageBox!.text.toString();
    });
  }
}//<<<<<<<