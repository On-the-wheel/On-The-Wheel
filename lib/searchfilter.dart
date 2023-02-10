import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:onthewheelpractice/map/naverMap.dart';

class Searchfilter extends StatefulWidget {
  _SearchfilterState createState() => _SearchfilterState();
}

class _SearchfilterState extends State<Searchfilter> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";
  bool doorsill = false;
  bool runway = false;
  bool elevator = false;
  bool parking = false;
  bool toilet = false;

  _SearchfilterState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('검색 상세필터'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1 / 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "편의시설로 검색",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if(!doorsill) doorsill = true;
                              else if(doorsill) doorsill=false;
                            });
                          }, // Handle your callback
                          child: ClipRRect(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              width: MediaQuery.of(context).size.width * 1 / 4,
                              height: 110,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/icondoorsill.png'),
                                    alignment: Alignment.topCenter,
                                    scale: 0.5,
                                  ),
                                  //color: Color(0xFFBCCF9B),
                                  border: Border.all(
                                    width: 4,
                                    color: doorsill
                                        ? Colors.redAccent
                                        : Color(0xFFBCCF9B),
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('문턱'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if(!runway) runway = true;
                              else if(runway) runway=false;
                            });
                          }, // Handle your callback
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            width: MediaQuery.of(context).size.width * 1 / 4,
                            height: 110,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/iconramp.png'),
                                    alignment: Alignment.topCenter),
                                //color: Color(0xFFBCCF9B),
                                border: Border.all(
                                  width: 4,
                                  color:
                                  runway ? Colors.redAccent : Color(0xFFBCCF9B),
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('경사로'),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if(!elevator) elevator = true;
                              else if(elevator) elevator=false;
                            });
                          }, // Handle your callback
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            width: MediaQuery.of(context).size.width * 1 / 4,
                            height: 110,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/iconelevator.png'),
                                  alignment: Alignment.topCenter,
                                  //fit: BoxFit.fitWidth,
                                  scale: 0.7,
                                ),
                                //color: Color(0xFFBCCF9B),
                                border: Border.all(
                                  width: 4,
                                  color:
                                  elevator ? Colors.redAccent : Color(0xFFBCCF9B),
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('엘리베이터'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    //fit: FlexFit.loose,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if(!parking) parking = true;
                              else if(parking) parking=false;
                            });
                          }, // Handle your callback
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            width: MediaQuery.of(context).size.width * 1 / 4,
                            height: 110,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/iconpark.png'),
                                    alignment: Alignment.topCenter),
                                border: Border.all(
                                  width: 4,
                                  color:
                                  parking ? Colors.redAccent : Color(0xFFBCCF9B),
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('주차장'),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if(!toilet) toilet = true;
                              else if(toilet) toilet=false;
                            });
                          }, // Handle your callback
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            width: MediaQuery.of(context).size.width * 1 / 4,
                            height: 110,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/icontoilet.png'),
                                    alignment: Alignment.topCenter),
                                //color: Color(0xFFBCCF9B),
                                border: Border.all(
                                  width: 4,
                                  color: toilet ? Colors.redAccent : Color(0xFFBCCF9B),
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('장애인 화장실'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: Text("결과보기"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFBCCF9B),
                  ),
                  onPressed: () {
                    if(!(doorsill||runway||elevator||parking||toilet)) {
                      showDialog(
                          context: context,
                          //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              //Dialog Main Title
                              title: Column(
                                children: <Widget>[
                                  new Text("검색필터"),
                                ],
                              ),
                              //
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "조건을 선택하여주세요.",
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                new TextButton(
                                  style: TextButton.styleFrom( primary: Colors.lightGreen,), // foreground
                                  child: new Text("확인"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    }
                    else Get.to(NaverMapTest(doorsill: doorsill, runway: runway, elevator: elevator, parking: parking, toilet: toilet,));
                  },
                ),
              )),
        ],
      ),

    );
  }
}
