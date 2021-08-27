import 'package:flutter/material.dart';
import 'package:sqlite/insertStudents.dart';
import 'package:sqlite/students.dart';
import 'package:sqlite/updateStudents.dart';
import 'databaseHandler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler(); //handler가 instance

    // Temp Action
    handler.initializeDB().whenComplete(() async {
      await addStudents();
      setState(() {}); // 화면에 보이려면 이거 해야함.
      // awiat 이기 때문에 화면 다 띄우고 Data가 돈다!
      // 그래서 setState 로 갱신
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite for Student'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InsertStudents();
                })).then((value) => reloadData());
              },
              icon: Icon(Icons.add_a_photo_outlined))
        ],
      ),
      body: FutureBuilder(
          future: handler.queryStudents(), // 불러와서 빌딩 하는 것
          builder:
              (BuildContext context, AsyncSnapshot<List<Students>> snapshot) {
            // context 현재 위치
            if (snapshot.hasData) {
              // Data 있으면 화면에 띄운다.
              return ListView.builder(
                  itemCount: snapshot.data?.length, // snapshot 은 Optional
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                        direction: DismissDirection.endToStart, // 없애는 방향
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete_forever,
                            size: 70,
                            color: Colors.white,
                          ),
                        ),
                        key: ValueKey<int>(snapshot.data![index].id!),
                        onDismissed: (DismissDirection direction) async {
                          await handler
                              .deleteStudents(snapshot.data![index].id!);
                          setState(() {
                            snapshot.data!.remove(snapshot.data![index]);
                          });
                        },
                        child: GestureDetector(
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Code :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(snapshot.data![index].code)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Name :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(snapshot.data![index].name)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Dept :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(snapshot.data![index].dept)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Phone :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(snapshot.data![index].phone)
                                  ],
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UpdateStudents(
                                  rcode: snapshot.data![index].code,
                                  rname: snapshot.data![index].name,
                                  rdept: snapshot.data![index].dept,
                                  rphone: snapshot.data![index].phone,
                                  );
                            })).then((value) => reloadData());
                          },
                        ));
                  });
            } else {
              // Data 없으면 indicator
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<int> addStudents() async {
    Students firstStudents =
        Students(code: 'MEMBER001', name: '쯔위', dept: '연극영화학과', phone: '1111');
    Students secondStudents =
        Students(code: 'MEMBER002', name: '모모', dept: '연극영화학과', phone: '1111');
    Students thirdStudents =
        Students(code: 'MEMBER003', name: '사나', dept: '연극영화학과', phone: '1111');

    List<Students> listOfStudents = [
      firstStudents,
      secondStudents,
      thirdStudents
    ];
    return await handler.insertStudents(listOfStudents);
    // for문을 사용하지 않고 한번에 넣기 위해 지금처럼 했다.
  }

  void reloadData() {
    handler.queryStudents();
  }
}
