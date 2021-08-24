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
      debugShowCheckedModeBanner: false,
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
  TextEditingController? _inputNum1;
  TextEditingController? _inputNum2;
  TextEditingController? _add;
  TextEditingController? _sub;
  TextEditingController? _mul;
  TextEditingController? _div;

  int num1 = 0;
  int num2 = 0;

  String message = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inputNum1 = TextEditingController();
    _inputNum2 = TextEditingController();
    _add = TextEditingController();
    _sub = TextEditingController();
    _mul = TextEditingController();
    _div = TextEditingController();

    //clear
    clear();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    '두개의 숫자 연산',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //Container는 크기를 줄수있어서 정렬하기 좋음!
                          child: Text('첫번째 숫자 : '),
                          width: 90,
                        ),
                        Container(
                          child: CupertinoTextField(
                            controller: _inputNum1,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            placeholder: '첫번째 숫자를 입력하세요',
                            textAlign: TextAlign.right,
                          ),
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //Container는 크기를 줄수있어서 정렬하기 좋음!
                          child: Text('두번째 숫자 : '),
                          width: 90,
                        ),
                        Container(
                          child: CupertinoTextField(
                            controller: _inputNum2,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            placeholder: '두번째 숫자를 입력하세요',
                            textAlign: TextAlign.right,
                          ),
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                    child: Text('계산하기'),
                    onPressed: () {
                      num1 = int.parse(_inputNum1!.text);
                      num2 = int.parse(_inputNum2!.text);
                      if (_inputNum1!.text.isEmpty ||
                          _inputNum2!.text.isEmpty) {
                        message = '숫자를 입력해주세요';
                      } else {
                        message = '계산이 완료되었습니다';
                      }

                      _add!.text = (num1 + num2).toString();
                      _sub!.text = (num1 - num2).toString();
                      _mul!.text = (num1 * num2).toString();
                      _div!.text = (num1 / num2).toStringAsFixed(2);

                      _inputNum1!.clear();
                      _inputNum2!.clear();
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //Container는 크기를 줄수있어서 정렬하기 좋음!
                          child: Text('덧셈 결과 : '),
                          width: 90,
                        ),
                        Container(
                          child: CupertinoTextField(
                            controller: _add,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            readOnly: true,
                            textAlign: TextAlign.right,
                          ),
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //Container는 크기를 줄수있어서 정렬하기 좋음!
                          child: Text('뺄셈 결과 : '),
                          width: 90,
                        ),
                        Container(
                          child: CupertinoTextField(
                            controller: _sub,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            readOnly: true,
                            textAlign: TextAlign.right,
                          ),
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //Container는 크기를 줄수있어서 정렬하기 좋음!
                          child: Text('곱셈 결과 : '),
                          width: 90,
                        ),
                        Container(
                          child: CupertinoTextField(
                            controller: _mul,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            readOnly: true,
                            textAlign: TextAlign.right,
                          ),
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //Container는 크기를 줄수있어서 정렬하기 좋음!
                          child: Text('나눗셈 결과 : '),
                          width: 90,
                        ),
                        Container(
                          child: CupertinoTextField(
                            controller: _div,
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            readOnly: true,
                            textAlign: TextAlign.right,
                          ),
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    '$message',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clear() {
    _inputNum1!.clear();
    _inputNum2!.clear();
    _add!.clear();
    _sub!.clear();
    _mul!.clear();
    _div!.clear();
  }
}
