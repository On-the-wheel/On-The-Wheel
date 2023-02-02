import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../Info.dart';
import '../placeinfo.dart';
import '../search_screen.dart';
import 'myPage/myPage_FAQ.dart';
import 'myPage/myPage_notice.dart';
import 'newPlace.dart';

List<Marker> rest_marker = [];
List<Marker> bokji_marker = [];
List<Marker> mart_marker = [];
List<Marker> all_marker = [];

class NaverMapTest extends StatefulWidget {
  @override
  _NaverMapTestState createState() => _NaverMapTestState();
}

class _NaverMapTestState extends State<NaverMapTest> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final imageUrl1 =
      'https://s3-alpha-sig.figma.com/img/7e62/21e6/b66f076abc8c42787d3343a22987d8be?Expires=1676246400&Signature=UDEA3OVmYCYzhlV2QFwfb4HIA2DUI~8byJ2YtkSdYXsMDDxzv9zyaVjtDgspv0HS8H0bKq52aLSu23dQ1JCTJ0y7vioLlWuDPBIlrxMKY55rax-p-dZrI6M8au5clCPzeqFTcCd4217pPIo7C-tK61eBdkgKuyKCdh7q5yetV7AKuc2Jn85MqjoC-2tB4nMsStGqAAwUYvTUnyt56DfExgLtxGZI0~EAiBCY44BzQmdh6M6o0ZDmKr5UPoRzfQpCPuvjks9YBTTOijmFNQ36D7Ypeu9-PnuB3nhsSu8cEcY28JTIEQIq6qZ~IsiVi4bKLViz3tYOJHt54kzpFP5fxA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4';

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('place')
            .orderBy('id', descending: false)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          // for (int i = 0; i < snapshot.data!.docs.length; i++) {
          //   var places = snapshot.data!.docs[i];
          //   var name = places.get('name');
          //   var info = places.get('info');
          //   var latitude = places.get('latitude');
          //   var longitude = places.get('longitude');
          //   var category = places.get('category');
          //   print(name + " : " + info + "\n");
          //
          //   if (category == "복지시설") {
          //     bokji_marker.add(
          //       Marker(
          //           width: 40,
          //           height: 50,
          //           position: LatLng(latitude, longitude),
          //           markerId: places.get('name'),
          //           iconTintColor: Colors.blueAccent),
          //     );
          //     all_marker.add(Marker(
          //         width: 40,
          //         height: 50,
          //         position: LatLng(latitude, longitude),
          //         markerId: places.get('name'),
          //         iconTintColor: Colors.blueAccent));
          //   } else if (category == "마트") {
          //     mart_marker.add(Marker(
          //         position: LatLng(latitude, longitude),
          //         markerId: places.get('name'),
          //         iconTintColor: Colors.redAccent));
          //     all_marker.add(Marker(
          //         position: LatLng(latitude, longitude),
          //         markerId: places.get('name'),
          //         iconTintColor: Colors.redAccent));
          //   } else if (category == "식당") {
          //     rest_marker.add(Marker(
          //         position: LatLng(latitude, longitude),
          //         markerId: places.get('name'),
          //         iconTintColor: Colors.purpleAccent));
          //     all_marker.add(Marker(
          //         position: LatLng(latitude, longitude),
          //         markerId: places.get('name'),
          //         iconTintColor: Colors.purpleAccent));
          //   }
          // }

          return Scaffold(
            key: _scaffoldKey,
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: NaverMap(
                      onMapCreated: onMapCreated,
                      mapType: _mapType,
                      markers: all_marker,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 6, 0, 0),
                    child: IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(Icons.menu, size: 30)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 8, 8, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: 500,
                        height: 50,
                        color: Colors.white,
                        child: Row(children: <Widget>[
                          Expanded(
                              child: TextField(
                            onTap: () {
                              Get.to(SearchScreen());
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 20,
                              ),
                              hintText: '검색',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                          )),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(imageUrl1),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Text('온더휠 님', style: TextStyle(fontSize: 15)),
                                Text('Lv.3',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF968686))),
                                Text('회원정보수정',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xFF968686)))
                              ],
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Text(
                                '장소 등록 6건',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ]),
                            VerticalDivider(
                              thickness: 1,
                              color: Colors.black,
                            ),
                            Column(children: [
                              Text(
                                '장소 평가 7건',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ]),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  ListTile(
                    title: Text('공지 사항'),
                    onTap: () {
                      Get.to(MyPage_notice());
                    },
                  ),
                  ListTile(
                    title: Text('FAQ'),
                    onTap: () {
                      Get.to(MyPage_FAQ());
                    },
                  ),
                  ListTile(
                    title: Text('문의'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('설정'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Log Out'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: Stack(
              children: <Widget>[
                Align(
                  //장소등록 '+' 아이콘
                  alignment: Alignment(
                      Alignment.bottomRight.x, Alignment.bottomRight.y - 0.4),
                  child: FloatingActionButton(
                    onPressed: () {
                      Get.to(Newplace());
                    },
                    child: Icon(Icons.add),
                  ),
                ),
                Align(
                  //장애인 콜택시 전화연결 아이콘
                  alignment: Alignment(
                      Alignment.bottomRight.x, Alignment.bottomRight.y - 0.2),
                  child: FloatingActionButton(
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text("포항북구 장애인 콜택시"),
                          content: Text('054-231-1117'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('취소'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {});
                                Navigator.of(context).pop();
                              },
                              child: Text('연락하기'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Icon(Icons.local_taxi),
                  ),
                ),
                Align(
                    //현재 위치 아이콘
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        Get.to(PlaceInfo());
                      },
                      child: Icon(Icons.my_location),
                    ))
              ],
            ),
          );
        });
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
