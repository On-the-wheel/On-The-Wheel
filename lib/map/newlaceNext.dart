import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'newPlace.dart';

class Place_creat extends StatefulWidget {
  Place_creat({Key? key}) : super(key: key);


  @override
  State<Place_creat> createState() => _State();
}

class _State extends State<Place_creat> {
  bool _wheelisChecked = false;
  bool _floorChecked = false;
  bool _WcisChecked = false;
  bool _ElevatorisChecked = false;
  bool _ArrowisChecked = false;
  bool _DoorisChecked = false;
  bool _ParkisChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: Icon(Icons.place_outlined, color: Colors.black),
            title: const Text(
                '장소등록',
                style: TextStyle(
                    color: Colors.black,
                  fontSize: 27
                )
            )
        ),
        backgroundColor: Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 20
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                            Icons.door_front_door_outlined,
                            color: Color(0xffbccf9b),
                            size: 30
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '문턱 있음',
                          style: TextStyle(
                              color: Color(0xFF8F8B8B),
                              fontSize: 19
                          ),
                        ),
                        SizedBox(
                          width: 160,
                        ),
                        Checkbox(
                            value: _wheelisChecked,
                            onChanged: (value) {
                              setState((){
                                _wheelisChecked =! _wheelisChecked;
                              });
                            }
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFF8F8B8B),
                      indent: 25,
                      endIndent: 25,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                            Icons.sensor_door_outlined,
                            color: Color(0xffbccf9b),
                            size: 30
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '문턱 없음',
                          style: TextStyle(
                              color: Color(0xFF8F8B8B),
                              fontSize: 19
                          ),
                        ),
                        SizedBox(
                          width: 160,
                        ),
                        Checkbox(
                            value: _floorChecked,
                            onChanged: (value) {
                              setState((){
                                _floorChecked =! _floorChecked;
                              });
                            }
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFF8F8B8B),
                      indent: 25,
                      endIndent: 25,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                            Icons.wc,
                            color: Color(0xffbccf9b),
                            size: 30
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '장애인 화장실',
                          style: TextStyle(
                              color: Color(0xFF8F8B8B),
                              fontSize: 19
                          ),
                        ),
                        SizedBox(
                          width: 123,
                        ),
                        Checkbox(
                            value: _WcisChecked,
                            onChanged: (value) {
                              setState((){
                                _WcisChecked =! _WcisChecked;
                              });
                            }
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFF8F8B8B),
                      indent: 25,
                      endIndent: 25,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                            Icons.elevator_rounded,
                            color: Color(0xffbccf9b),
                            size: 30
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '엘리베이터',
                          style: TextStyle(
                              color: Color(0xFF8F8B8B),
                              fontSize: 19
                          ),
                        ),
                        SizedBox(
                          width: 148,
                        ),
                        Checkbox(
                            value: _ElevatorisChecked,
                            onChanged: (value) {
                              setState((){
                                _ElevatorisChecked =! _ElevatorisChecked;
                              });
                            }
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFF8F8B8B),
                      indent: 25,
                      endIndent: 25,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                            Icons.signal_cellular_4_bar,
                            color: Color(0xffbccf9b),
                            size: 30
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '경사로',
                          style: TextStyle(
                              color: Color(0xFF8F8B8B),
                              fontSize: 19
                          ),
                        ),
                        SizedBox(
                          width: 185,
                        ),
                        Checkbox(
                            value: _ArrowisChecked,
                            onChanged: (value) {
                              setState((){
                                _ArrowisChecked =! _ArrowisChecked;
                              });
                            }
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFF8F8B8B),
                      indent: 25,
                      endIndent: 25,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                            Icons.looks_one,
                            color: Color(0xffbccf9b),
                            size: 30
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '1층에 위치',
                          style: TextStyle(
                              color: Color(0xFF8F8B8B),
                              fontSize: 19
                          ),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Checkbox(
                            value: _DoorisChecked,
                            onChanged: (value) {
                              setState((){
                                _DoorisChecked =! _DoorisChecked;
                              });
                            }
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFF8F8B8B),
                      indent: 25,
                      endIndent: 25,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                            Icons.pets,
                            color: Color(0xffbccf9b),
                            size: 30
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '안내견 출입가능',
                          style: TextStyle(
                              color: Color(0xFF8F8B8B),
                              fontSize: 19
                          ),
                        ),
                        SizedBox(
                          width: 105,
                        ),
                        Checkbox(
                            value: _DoorisChecked,
                            onChanged: (value) {
                              setState((){
                                _DoorisChecked =! _DoorisChecked;
                              });
                            }
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFF8F8B8B),
                      indent: 25,
                      endIndent: 25,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                            Icons.local_parking_outlined,
                            color: Color(0xffbccf9b),
                            size: 30
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '장애인 주차장',
                          style: TextStyle(
                              color: Color(0xFF8F8B8B),
                              fontSize: 19
                          ),
                        ),
                        SizedBox(
                          width: 123,
                        ),
                        Checkbox(
                            value: _ParkisChecked,
                            onChanged: (value) {
                              setState((){
                                _ParkisChecked =! _ParkisChecked;
                              });
                            }
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFF8F8B8B),
                      indent: 25,
                      endIndent: 25,
                    ),
                    SizedBox(
                        height: 50
                    ),
                    Center(
                      child: SizedBox(
                        height: 60,
                        width: 360,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(Newplace());
                          },
                          child: Text(
                            "이전",
                            style: TextStyle(fontSize: 25),
                          ),
                          style: ElevatedButton.styleFrom(backgroundColor: Color(0xffbccf9b)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: SizedBox(
                        height: 60,
                        width: 360,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text(
                            "다음",
                            style: TextStyle(fontSize: 25),
                          ),
                          style: ElevatedButton.styleFrom(backgroundColor: Color(0xffbccf9b)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,)

                  ]

              )
          ),
        )

    );
  }
}