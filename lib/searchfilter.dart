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
        title: const Text('검색 상세조건'),
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
                              doorsill = true;
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
                                        'assets/images/search/icondoorsill.png'),
                                    alignment: Alignment.topCenter,
                                    scale: 0.5,
                                  ),
                                  //color: Color(0xFFBCCF9B),
                                  border: Border.all(
                                    width: 4,
                                    color: doorsill
                                        ? Colors.red
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
                              runway = true;
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
                                        'assets/images/search/iconramp.png'),
                                    alignment: Alignment.topCenter),
                                //color: Color(0xFFBCCF9B),
                                border: Border.all(
                                  width: 4,
                                  color:
                                  runway ? Colors.red : Color(0xFFBCCF9B),
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
                              elevator = true;
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
                                      'assets/images/search/iconelevator.png'),
                                  alignment: Alignment.topCenter,
                                  //fit: BoxFit.fitWidth,
                                  scale: 0.7,
                                ),
                                //color: Color(0xFFBCCF9B),
                                border: Border.all(
                                  width: 4,
                                  color:
                                  elevator ? Colors.red : Color(0xFFBCCF9B),
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
                              parking = true;
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
                                        'assets/images/search/iconpark.png'),
                                    alignment: Alignment.topCenter),
                                border: Border.all(
                                  width: 4,
                                  color:
                                  parking ? Colors.red : Color(0xFFBCCF9B),
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
                              toilet = true;
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
                                        'assets/images/search/icontoilet.png'),
                                    alignment: Alignment.topCenter),
                                //color: Color(0xFFBCCF9B),
                                border: Border.all(
                                  width: 4,
                                  color:
                                  toilet ? Colors.red : Color(0xFFBCCF9B),
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
                    //Get.to(NaverMapTest.filter(doorsill,runway,elevator,parking,toilet));
                  },
                ),
              )),
        ],
      ),

    );
  }
}
