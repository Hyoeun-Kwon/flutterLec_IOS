import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  /*
  서울상상나라	    37.54945787  / 127.0862609
  둘리뮤지엄        37.65243153 / 127.0276397
  서대문형무소역사관	37.57244171 /	126.9595412

  */

  int _kindChoice = 0; //Segmented Control 출발 번호

// Segment Widget
  Map<int, Widget> segmentWidgets = {
    //int, Widget : 0번이면 어떤 위젯을 해라
    //0번
    0: SizedBox(
      //SizedBox도 컨테이너랑 비슷하게 사용 가능
      child: Text(
        '서울상상나라',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
    //1번
    1: SizedBox(
      //SizedBox도 컨테이너랑 같게 사용 가능 -> 컨테이너로 바꿔도 ok
      child: Text(
        '둘리뮤지엄',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
    //2번
    2: SizedBox(
      //SizedBox도 컨테이너랑 비슷하게 사용 가능
      child: Text(
        '서대문형무소역사관',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
      //sizedbox의 크기 (세크먼트 각각 네모)
      width: 120,
    ),
  };

  //위도 경도 : 서울 상상나라
  double latData = 37.54945787;
  double longData = 127.0862609;
  //맵 컨트롤
  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    //dart : Lib 밑에 소스, 뷰, 모델  - BLOC

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[50],
        title: Center(
          child: Column(
            //material 과 Cupertino 같이 사용 가능
            children: [
              //segmentedControl - radio 버튼과 같음! -> 그룹이 필요
              CupertinoSegmentedControl(
                  groupValue: _kindChoice, //현재 초기 : 0번
                  children:
                      segmentWidgets, //children이 segmentWidgets 로 만들어 둔 것 (0번은 위젯이 뭐야)
                  onValueChanged: (value) {
                    _kindChoice = value
                        as int; // segment가 안드로이드로 돌릴때 오류가 있기도 해서 -> as int
                    if (_kindChoice == 0) {
                      //서울 상상나라
                      latData = 37.54945787;
                      longData = 127.0862609;
                      //위도 경도 줬는데 안움직인다? control을 move
                      mapController.move(
                        latlng.LatLng(latData, longData), //움직여라
                        17.0, //줌 (확대 크기)
                      );
                    } else if (_kindChoice == 1) {
                      //둘리 뮤지엄
                      latData = 37.65243153;
                      longData = 127.0276397;
                      //위도 경도 줬는데 안움직인다? control을 move
                      mapController.move(
                        latlng.LatLng(latData, longData), //움직여라
                        17.0, //줌 (확대 크기)
                      );
                    } else {
                      //서대문 형무소
                      latData = 37.57244171;
                      longData = 126.9595412;
                      //위도 경도 줬는데 안움직인다? control을 move
                      mapController.move(
                        latlng.LatLng(latData, longData), //움직여라
                        17.0, //줌 (확대 크기)
                      );
                    }
                  }),
            ],
          ),
        ),
        //appbar의 크기
        toolbarHeight: 100,
      ),
      body: flutterMap(),
    );
  }

  //body에 넣을 위젯 함수 -> 이렇게 분리해서 사용!! 기본 권장 사항
  //보통은 클래스를 따로 만들어서 사용
  Widget flutterMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        //option은 센터값등을 정해줌
        center: latlng.LatLng(latData, longData),
        zoom: 17.0,
      ),
      //그림을 그려서 넣어줘야함
      layers: [
        TileLayerOptions(
            // 한 화면에 보는 지도를 타일 처럼 쪼개 두고 이름을 TileLayer라고 이름 붙인 것
            //그림 페이지값을 받아오는 url
            //fluttermap은 전세계 맵을 png로 받아놨음!
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(markers: [
          Marker(
              //marker 크기
              width: 80.0,
              height: 80.0,
              point: latlng.LatLng(latData, longData),
              builder: (ctx) => Container(
                    child: Icon(
                      Icons.pin_drop_outlined,
                      size: 50.0,
                      color: Colors.red,
                    ),
                  ))
        ])
      ],
    );
  }
} // < -------
