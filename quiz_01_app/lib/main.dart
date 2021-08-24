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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  bool nameChange = false;
  String sText = 'Welcome!';

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$sText'),
              SizedBox(
                height: 100,
              ),
              CupertinoButton(
                  child: Text('Name'),
                  onPressed: () {
                    setState(() {
                      if (nameChange == false) {
                        sText = 'Welcome!';
                        nameChange = true;
                      } else {
                        sText = 'Welcome! He';
                        nameChange = false;
                      }
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
