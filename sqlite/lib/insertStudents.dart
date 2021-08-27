import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertStudents extends StatefulWidget {
  
  const InsertStudents({Key? key}) : super(key: key);

  @override
  _InsertStudentsState createState() => _InsertStudentsState();
}

class _InsertStudentsState extends State<InsertStudents> {
  TextEditingController? codeController;
  TextEditingController? nameController;
  TextEditingController? deptController;
  TextEditingController? phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
