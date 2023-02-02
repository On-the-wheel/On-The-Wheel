import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    color: Colors.black
                )
            )
        ),
        backgroundColor: Color(0xFFFFFFFF),
        body: Center(
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
                          Icons.accessible_forward_outlined,
                          color: Colors.black,
                          size: 30
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '휠체어 진입로',
                        style: TextStyle(
                            color: Color(0xFF8F8B8B),
                            fontSize: 19
                        ),
                      ),
                      SizedBox(
                        width: 115,
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
                          Icons.looks_one_outlined,
                          color: Colors.black,
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
                        width: 139,
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
                          color: Colors.black,
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
                        width: 115,
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
                          color: Colors.black,
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
                        width: 137,
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
                          color: Colors.black,
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
                        width: 172,
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
                          Icons.door_back_door,
                          color: Colors.black,
                          size: 30
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        '문턱',
                        style: TextStyle(
                            color: Color(0xFF8F8B8B),
                            fontSize: 19
                        ),
                      ),
                      SizedBox(
                        width: 190,
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
                          color: Colors.black,
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
                        width: 115,
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


                  SizedBox(
                      height: 120
                  ),
                  Container(
                      width: 280,
                      height: 42,
                      decoration: BoxDecoration(
                          color: Color(0xFFBCCF9B),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '완료',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFFFFFFFF)
                              ),
                            )
                          ]
                      )
                  )


                ]

            )
        )

    );
  }
}