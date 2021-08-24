import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

//데이터 왔다갓다 -> stateful
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController? _guguDan;
  TextEditingController? _Dan;

  String dan = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _guguDan = TextEditingController();
    _Dan = TextEditingController();
    _Dan!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  '구구단 출력',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CupertinoTextField(
                      controller: _Dan,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      placeholder: '단을 입력하세요!',
                    ),
                    width: 280,
                  ),
                  CupertinoButton(
                      child: Text('단 출력'),
                      onPressed: () {
                        setState(() {
                          dan = _Dan!.text;

                          guguDan();
                          _Dan!.clear();
                        });
                      })
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                child: CupertinoTextField(
                  controller: _guguDan,
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  decoration: BoxDecoration(color: Colors.amber[100]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void guguDan() {
    //_guguDan!.text += _Dan!.text + "\n";
    _guguDan!.text = "";
    for (int i = 1; i < 10; i++) {
      _guguDan!.text += '$dan X $i = ${int.parse(dan) * i}' + '\n';
    }
  }
}//-----------
