import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:onthewheelpractice/map/myPage/myPage_setting.dart';
import 'package:onthewheelpractice/map/placeModal.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Info.dart';
import '../placeinfo.dart';
import '../search_screen.dart';
import '../searchfilter.dart';
import '../size.dart';
import 'myPage/myPage_FAQ.dart';
import 'myPage/myPage_notice.dart';
import 'newPlace.dart';

List<Marker> test_marker = [];
List<Marker> rest_marker = [];
List<Marker> bokji_marker = [];
List<Marker> mart_marker = [];
List<Marker> all_marker = [];
int count = 0;

late OverlayImage office_image; //복지시설 아이콘
late OverlayImage mart_image; //마트 아이콘
late OverlayImage restaurant_image; // 레스토랑 아이콘

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
  late double lat = 36.08052391749029;
  late double lng = 129.39873537642814;
  late Position position;

  Future getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    bool serviceEnabled;
    LocationPermission permission;

// Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return;
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return;
      }
    }

// When we reach here, permissions are granted and we can
// continue accessing the position of the device.
    position = await Geolocator.getCurrentPosition();
  }

  Future getImage() async {
    office_image = await OverlayImage.fromAssetImage(
        assetName: "assets/images/office.png", context: context);
    mart_image = await OverlayImage.fromAssetImage(
        assetName: "assets/images/mart.png", context: context);
    restaurant_image = await OverlayImage.fromAssetImage(
        assetName: "assets/images/restaurant.png", context: context);
    // else if(name == "마트") test_image = await OverlayImage.fromAssetImage(assetName: "assets/images/mart.png", context: context);
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    all_marker.clear();
    bokji_marker.clear();
    mart_marker.clear();
    rest_marker.clear();

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('place')
            .orderBy('id', descending: false)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (count == 0) {
            getImage();
            print("클릭");
            test_marker = all_marker;
            count++;
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              // snapshot.data!.docs.length
              var places = snapshot.data!.docs[i];

              var name = places.get('name');
              var info = places.get('info');
              var location = places.get('location');
              var latitude = places.get('latitude');
              var longitude = places.get('longitude');
              var category = places.get('category');
              print(name + " : " + info + "\n");

              if (category == "복지시설") {
                Marker marker = makeMarker(name, category, location, latitude,
                    longitude, info, Colors.blueAccent, office_image);
                bokji_marker.add(marker);
                all_marker.add(marker);
              } else if (category == "마트") {
                Marker marker = makeMarker(name, category, location, latitude,
                    longitude, info, Colors.redAccent, mart_image);
                mart_marker.add(marker);
                all_marker.add(marker);
              } else if (category == "식당") {
                Marker marker = makeMarker(name, category, location, latitude,
                    longitude, info, Colors.purpleAccent, restaurant_image);
                rest_marker.add(marker);
                all_marker.add(marker);
              }
            }

            return Scaffold(
              key: _scaffoldKey,
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: NaverMap(
                        initialCameraPosition:
                            CameraPosition(target: LatLng(lat, lng)),
                        onMapCreated: onMapCreated,
                        mapType: _mapType,
                        markers: test_marker,
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
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.filter_alt_sharp),
                                    color: Colors.black,
                                    onPressed: (){
                                      Get.to(Searchfilter());
                                    },
                                  ),
                                hintText: '검색',
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                            )),
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 160,
                            width: 17,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 60, 0, 0),
                      child: Column(
                        children: [
                          Container(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    child: Row(children: [
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          test_marker = rest_marker;
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.restaurant, size: 18),
                                        label: Text("음식점 & 카페"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              //모서리를 둥글게
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          side: BorderSide(
                                            color: Colors.lightGreen,
                                          ),
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          foregroundColor: Colors.lightGreen,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                    child: Row(children: [
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          // // test_marker = bokji_marker;
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.medication, size: 18),
                                        label: Text("병원"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              //모서리를 둥글게
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          side: BorderSide(
                                            color: Colors.lightGreen,
                                          ),
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          foregroundColor: Colors.lightGreen,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                    child: Row(children: [
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          test_marker = bokji_marker;
                                          setState(() {});
                                        },
                                        icon: Icon(
                                            Icons.account_balance_outlined,
                                            size: 18),
                                        label: Text("복지시설"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              //모서리를 둥글게
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          side: BorderSide(
                                            color: Colors.lightGreen,
                                          ),
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          foregroundColor: Colors.lightGreen,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                    child: Row(children: [
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          // // test_marker = bokji_marker;
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.aspect_ratio_outlined,
                                            size: 18),
                                        label: Text("편의시설"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              //모서리를 둥글게
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          side: BorderSide(
                                            color: Colors.lightGreen,
                                          ),
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          foregroundColor: Colors.lightGreen,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                    child: Row(children: [
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          // test_marker = bokji_marker;
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.wc_outlined, size: 18),
                                        label: Text("화장실"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              //모서리를 둥글게
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          side: BorderSide(
                                            color: Colors.lightGreen,
                                          ),
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          foregroundColor: Colors.lightGreen,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                    child: Row(children: [
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          test_marker = mart_marker;
                                          // setState(() {});
                                        },
                                        icon: Icon(Icons.shopping_cart_outlined,
                                            size: 18),
                                        label: Text("마트"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              //모서리를 둥글게
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          side: BorderSide(
                                            color: Colors.lightGreen,
                                          ),
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          foregroundColor: Colors.lightGreen,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                    child: Row(children: [
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          // // test_marker = bokji_marker;
                                          // setState(() {});
                                        },
                                        icon: Icon(Icons.menu_book_outlined,
                                            size: 18),
                                        label: Text("교육시설"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              //모서리를 둥글게
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          side: BorderSide(
                                            color: Colors.lightGreen,
                                          ),
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          foregroundColor: Colors.lightGreen,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                    child: Row(children: [
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          // // test_marker = bokji_marker;
                                          // setState(() {});
                                        },
                                        icon:
                                            Icon(Icons.bed_outlined, size: 18),
                                        label: Text("숙박시설"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              //모서리를 둥글게
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          side: BorderSide(
                                            color: Colors.lightGreen,
                                          ),
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          foregroundColor: Colors.lightGreen,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                    child: Row(children: [
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          // // test_marker = bokji_marker;
                                          // setState(() {});
                                        },
                                        icon:
                                            Icon(Icons.more_outlined, size: 18),
                                        label: Text("기타"),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              //모서리를 둥글게
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          side: BorderSide(
                                            color: Colors.lightGreen,
                                          ),
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          foregroundColor: Colors.lightGreen,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                    onTap: () {},
                                  ),
                                  // _mainButton( Icons.restaurant, "음식점 & 카페"),
                                  // _mainButton(Icons.medication, "병원"),
                                  // _mainButton(Icons.account_balance_outlined, "복지시설", context),
                                  // _mainButton(Icons.aspect_ratio_outlined, "편의시설"),
                                  // _mainButton(Icons.wc_outlined, "화장실"),
                                  // _mainButton(Icons.shopping_cart_outlined,"마트"),
                                  // _mainButton(Icons.menu_book_outlined, "교육시설"),
                                  // _mainButton(Icons.bed_outlined,"숙박시설"),
                                  // _mainButton(Icons.more_outlined, "기타"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
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
                      title: Text('문의'),
                      onTap: () {
                        Get.to(MyPage_FAQ());
                      },
                    ),
                    ListTile(
                      title: Text('설정'),
                      onTap: () {
                        Get.to(MyPage_Setting());
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
                                child: Text(
                                  '취소',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final url = Uri.parse('tel:0542311117');
                                  launchUrl(url);
                                },
                                child: Text(
                                  '연락하기',
                                  style: TextStyle(color: Colors.black),
                                ),
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
                        onPressed: () async {
                          getCurrentLocation();

                          final controller = await _controller.future;
                          controller.moveCamera(CameraUpdate.toCameraPosition(
                              CameraPosition(
                                  target: LatLng(
                                      position.latitude, position.longitude))));
                        },
                        child: Icon(Icons.my_location),
                      ))
                ],
              ),
            );
          }
        });
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

  Marker makeMarker(
      String name,
      String category,
      String location,
      double latitude,
      double longitude,
      String info,
      Color color,
      OverlayImage test_image) {
    return Marker(
      // icon: OverlayImage(AssetImage('assets/images/hgu.png'), AssetBundleImageKey(null, null, null)),
      // icon: OverlayImage(Image( image: AssetImage('assets/images/hgu.png'),)),
      icon: test_image,
      onMarkerTab: (marker, iconSize) {
        showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            context: context,
            builder: (context) => Container(
                  height: getScreenHeight(context) * 0.3,
                  child: placeModal(name, category, location, info),
                ));
      },
      width: 40,
      height: 50,
      position: LatLng(latitude, longitude),
      markerId: name,
    );
  }
}
