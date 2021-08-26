import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _imageFile = ['flower_01.png', 'flower_02.png', 'flower_03.png'];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      scrollDirection: Axis.vertical,
      controller: controller,
      children: [
        //글자 + image3개에 대한 정보 들어가기
        //-----------------1page
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_imageFile[_currentPage]}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'images/${_imageFile[_currentPage]}',
                fit: BoxFit.contain,
                width: 300,
                height: 600,
              ),
            ],
          ),
        ),
        //-----------------1page
        //-----------------2page

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_imageFile[_currentPage + 1]}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'images/${_imageFile[_currentPage + 1]}',
                fit: BoxFit.contain,
                width: 300,
                height: 600,
              ),
            ],
          ),
        ),
        //-----------------2page

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_imageFile[_currentPage + 2]}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'images/${_imageFile[_currentPage + 2]}',
                fit: BoxFit.contain,
                width: 300,
                height: 600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
