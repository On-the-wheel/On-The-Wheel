import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onthewheelpractice/map/addImage.dart';

import 'naverMap.dart';
import 'newlaceNext.dart';


class Newplace extends StatefulWidget {
  const Newplace({Key? key}) : super(key: key);

  @override
  State<Newplace> createState() => _NewplaceState();
}

class _NewplaceState extends State<Newplace> {
  final List<String> _placeList = ['복지시설', '편의시설','교육시설','숙박시설', '병원','식당','카페','음식점','마트','기타'];
  String _selectedValue = '복지시설';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
              '장소등록',
              style: TextStyle(
                  color: Colors.black, fontSize: 27
              )
          )
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [

                Row(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                    Text(
                      '장소 종류',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      color: Colors.white70,
                      width: 245,
                      height: 50,
                      child: DropdownButton(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          isExpanded: true,
                          value: _selectedValue,
                          items: _placeList.map((String item) {
                            return DropdownMenuItem<String>(
                                child: Text('$item'), value: item);
                          }).toList(),
                          onChanged: (dynamic value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          }),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(13, 0, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: '장소 이름',
                      enabledBorder: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(13, 0, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: '위치 설정',
                      enabledBorder: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(13, 0, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: '운영시간',
                      hintText: 'ex)10:00 - 20:00',
                      enabledBorder: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(13, 0, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: '전화번호',
                      enabledBorder: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(13, 0, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: '추가사항',
                      enabledBorder: UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                      height: 60,
                      width: 360,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.to(AddImages());
                        },
                        icon: Icon(
                          Icons.photo_camera,
                          size: 40,
                        ),
                        label: Text(
                          '사진 등록하기',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffbccf9b)),
                      )),
                ),
                SizedBox(height: 90,),
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 360,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(Place_creat());
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

