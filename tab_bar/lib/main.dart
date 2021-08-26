import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_bar/firstPage.dart';
import 'package:tab_bar/secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  //tabBar
  late CupertinoTabBar tabBar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabBar = CupertinoTabBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: 'Image View',
        icon: Icon(CupertinoIcons.star),
      ),
      BottomNavigationBarItem(
        label: 'Date Picker',
        icon: Icon(CupertinoIcons.book),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: tabBar,
        tabBuilder: (context, value) {
          if (value == 0) {
            return FirstPage(); // return 값으로 class 가 있어야함

          } else {
            return SecondPage();
          }
        },
      ),
    );
  }
}
