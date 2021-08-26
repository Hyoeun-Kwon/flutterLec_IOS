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
  // List map = [
  //   ["혜화문", 37.5878892, 127.0037098],
  //   ["홍인지문", 37.5711907, 127.009506],
  //   ["창의문", 37.5926027, 126.9664771],
  //   ["숙정문", 37.5956584, 126.9810576]
  // ];
  List location = ["혜화문", "흥인지문", "창의문", "숙정문"];
  List latData = [37.5878892, 37.5711907, 37.5926027, 37.5956584];
  List longData = [127.0037098, 127.009506, 126.9664771, 126.9810576];
  List<Marker> markers = [];

  int _kindChoice = 0; //Segmented Control 출발 번호

  //맵 컨트롤
  MapController mapController = MapController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeMarker();
  }

  @override
  Widget build(BuildContext context) {
    //dart : Lib 밑에 소스, 뷰, 모델  - BLOC

    return CupertinoApp(
      home: CupertinoPageScaffold(child: flutterMap()),
    );
  }

  //body에 넣을 위젯 함수 -> 이렇게 분리해서 사용!! 기본 권장 사항
  //보통은 클래스를 따로 만들어서 사용
  Widget flutterMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        //option은 센터값등을 정해줌
        center: latlng.LatLng(37.5878892, 127.009506),

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
        MarkerLayerOptions(
          markers: markers,
        ),
      ],
    );
  }

  void makeMarker() {
    for (var i = 0; i < location.length; i++) {
      Marker marker = Marker(
        width: 80.0,
        height: 80.0,
        point: latlng.LatLng(latData[i], longData[i]),
        builder: (ctx) => Container(
          child: Icon(
            Icons.pin_drop,
            size: 50,
            color: i % 2 == 0 ? Colors.black : Colors.red,
          ),
        ),
      );
      setState(() {
        markers.add(marker);
      });
    }
  }
} // < -------
