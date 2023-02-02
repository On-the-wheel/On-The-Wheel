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
import '../search_screen.dart';
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
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            var places = snapshot.data!.docs[i];
            var name = places.get('name');
            var info = places.get('info');
            var latitude = places.get('latitude');
            var longitude = places.get('longitude');
            var category = places.get('category');
            print(name + " : " + info + "\n");

            if (category == "복지시설") {
              bokji_marker.add(
                Marker(
                    width: 40,
                    height: 50,
                    position: LatLng(latitude, longitude),
                    markerId: places.get('name'),
                    iconTintColor: Colors.blueAccent),
              );
              all_marker.add(Marker(
                  width: 40,
                  height: 50,
                  position: LatLng(latitude, longitude),
                  markerId: places.get('name'),
                  iconTintColor: Colors.blueAccent));
            } else if (category == "마트") {
              mart_marker.add(Marker(
                  position: LatLng(latitude, longitude),
                  markerId: places.get('name'),
                  iconTintColor: Colors.redAccent));
              all_marker.add(Marker(
                  position: LatLng(latitude, longitude),
                  markerId: places.get('name'),
                  iconTintColor: Colors.redAccent));
            } else if (category == "식당") {
              rest_marker.add(Marker(
                  position: LatLng(latitude, longitude),
                  markerId: places.get('name'),
                  iconTintColor: Colors.purpleAccent));
              all_marker.add(Marker(
                  position: LatLng(latitude, longitude),
                  markerId: places.get('name'),
                  iconTintColor: Colors.purpleAccent));
            }
          }

          return Scaffold(
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
                    padding: const EdgeInsets.all(8.0),

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
            bottomNavigationBar: BottomAppBar(
              color: Colors.lightGreen,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.to(Newplace());
                      },
                      icon: Icon(Icons.abc))
                ],
              ),
            ),
          );
        });
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
