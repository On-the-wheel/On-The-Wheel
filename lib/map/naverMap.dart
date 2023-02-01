import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

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
      appBar: AppBar(title: const Text('NaverMap Test')),
      body: Container(
        child: Stack(
          children: [
            NaverMap(
              zoomGestureEnable: true,
              onMapCreated: onMapCreated,
              mapType: _mapType,
            ),
            Row(
              children: [
                //Padding(padding: EdgeInsets.fromLTRB(-, 30, 30, 30)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    )),


              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(Newplace());
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.lightGreen,
                    size: 40,
                  )),
              TextButton(
                onPressed: () {},
                child: Text(
                  "콜택시",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
