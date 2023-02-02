import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

import 'MapProvider.dart';
import 'newPlace.dart';


class NaverMapTest extends StatelessWidget {
  NaverMapTest({Key? key, required this.mapProvider}) : super(key: key);
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  final MapProvider mapProvider;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NaverMap Test')),
      body: Stack(
        children: <Widget>[NaverMap(
          initLocationTrackingMode: this.mapProvider.trackingMode,
          initialCameraPosition: CameraPosition(target: this.mapProvider.initLocation),
          locationButtonEnable: true,
          onMapCreated: (NaverMapController ct) async {

          },
          mapType: _mapType,

        ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
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

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(position.latitude);

    return position;
  }
}
