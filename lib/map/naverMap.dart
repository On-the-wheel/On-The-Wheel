import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import '../util/search_screen.dart';
import 'newPlace.dart';

class NaverMapTest extends StatefulWidget {
  @override
  _NaverMapTestState createState() => _NaverMapTestState();
}

class _NaverMapTestState extends State<NaverMapTest> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('On The Wheel'),
        backgroundColor: Colors.lightGreen,
      ),

      body: Stack(
        children: <Widget>[
          Container(
            child: NaverMap(
              onMapCreated: onMapCreated,
              mapType: _mapType,
            ),
          ),
        Container(
               width: 500,
               height: 50,
               color: Colors.white,
                child: Row(
                    children: <Widget>[
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
                            hintText:  '검색',
                            labelStyle: TextStyle(color: Colors.black),

                          ),
                      )
                      ),
                    ]

                ),
              ),
                ],
          ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        child: Row(
          children: [

            IconButton(onPressed: (){
              Get.to(Newplace());
            }, icon: Icon(Icons.abc))
          ],
        ),
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}

