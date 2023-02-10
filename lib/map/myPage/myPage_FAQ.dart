import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'notice/FAQ_method.dart';

class MyPage_FAQ extends StatelessWidget {
  const MyPage_FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFBCCF9B),
        title: const Text(
          '자주 묻는 질문(FAQ)',
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              number1Newplace(),
              Divider(height: 1,thickness: 1,color: Colors.black,),
              number2Newplace(),
              Divider(height: 1,thickness: 1,color: Colors.black,),
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            //현재 위치 아이콘
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(FAQ_Method());
                },
                child: Text('문의하기',style: TextStyle(fontSize: 17),),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFBCCF9B)),
              )
          )
        ],
      ),
    );
  }
}

Widget number1Newplace() {
  return ExpansionTile(
    iconColor: Colors.grey,
    title: Text(
      '장소등록 하는 법',
      style: TextStyle(color: Colors.black, fontSize: 20),
    ),
    backgroundColor: Colors.white,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Q. 새로운 배리어프리 시설을 발견했어요. or 개업을 했는데 배리어프리 시설로 등록하고 싶어요. 새로운 장소를 어떻게 등록하나요?',style: TextStyle(fontSize: 18),),
      ),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('A. 홈화면(지도화면) - 우측 하단 플러스 모양 아이콘 - 장소등록 페이지를 통해서 추가해주세요!',style: TextStyle(fontSize: 18),),
      ),

    ],
  );
}

Widget number2Newplace() {
  return ExpansionTile(
    iconColor: Colors.grey,
    title: Text(
      '왜 포항지역 정보밖에 없나요?',
      style: TextStyle(color: Colors.black, fontSize: 20),
    ),
    backgroundColor: Colors.white,
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('A. 현재 베타 테스트 기간으로, 포항 지역만 서비스하고 있습니다. 차차 전국적으로 서비스를 확장시켜나갈 계획입니다. 함께 지켜봐주시면 감사하겠습니다 :)',style: TextStyle(fontSize: 18),),
      ),
    ],
  );
}
