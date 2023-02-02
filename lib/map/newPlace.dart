import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'naverMap.dart';
import 'newlaceNext.dart';


class Newplace extends StatefulWidget {
  const Newplace({Key? key}) : super(key: key);

  @override
  State<Newplace> createState() => _NewplaceState();
}

class _NewplaceState extends State<Newplace> {
  final List<String> _placeList = ['복지시설', '편의시설', '병원','식당','카페'];
  String _selectedValue = '복지시설';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.off(NaverMapTest());
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 35,
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  "         장소 등록",
                  style: TextStyle(fontSize: 40),
                )
              ],
            ),
            Container(
              width: 350,
              height: 1,
              color: Colors.grey,
            ),
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
                  width: 200,
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
              width: 350,
              height: 1,
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(13, 0, 20, 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '장소명',
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
                      //et.to(Getimage());
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
                        backgroundColor: Color(0xffBCCF9B)),
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
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xffBCCF9B)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
