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
  //TextField
  TextEditingController? _productName;
  TextEditingController? _productSize;
  TextEditingController? _productWeight;
  TextEditingController? _productBag;
  TextEditingController? _productColor;

  String productName = "맥북에어";
  String productSize = "16";
  String productWeight = "2.56";
  String productBag = "false";
  String productColor = "실버";

  //데이터값 주기
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productName = TextEditingController();
    _productSize = TextEditingController();
    _productWeight = TextEditingController();
    _productBag = TextEditingController();
    _productColor = TextEditingController();
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
                padding: const EdgeInsets.only(bottom: 100),
                child: Text(
                  'Computer 사양',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                        child: Text('제품명 : '),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _productName,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          placeholder: '제품명',
                          readOnly: true,
                        ),
                        width: 150,
                      )
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
                        child: Text('화면크기 : '),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _productSize,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          placeholder: '화면크기',
                        ),
                        width: 150,
                      )
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
                        child: Text('무게 : '),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _productWeight,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          placeholder: '무게',
                        ),
                        width: 150,
                      )
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
                        child: Text('가방 : '),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _productBag,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          placeholder: '가방',
                        ),
                        width: 150,
                      )
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
                        child: Text('색상 : '),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _productColor,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          placeholder: '색상',
                        ),
                        width: 150,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                  child: Text('OK'),
                  onPressed: () {
                    _productName!.text = productName;
                    _productSize!.text = productSize;
                    _productWeight!.text = productWeight;
                    _productBag!.text = productBag;
                    _productColor!.text = productColor;
                  }),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                  child: Text('Clear'),
                  onPressed: () {
                    _productName!.clear();
                    _productSize!.clear();
                    _productWeight!.clear();
                    _productBag!.clear();
                    _productColor!.clear();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
