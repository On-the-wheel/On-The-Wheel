import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size.dart';

class Notice_1 extends StatelessWidget {
  const Notice_1({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFBCCF9B),
        title: const Text('공지사항 1',style: TextStyle(fontSize: 25),),
      ),

      body: SafeArea(
        child: SingleChildScrollView(

          padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: [
                  SizedBox(width: 50,height: 5,),
                  Text('On The Wheel 서비스 시작',style: TextStyle(fontSize: 30),),
                  SizedBox(width: 50,height: 10),
                  Text('2023.2.10',style: TextStyle(fontSize: 16,color: Colors.grey),),
                  SizedBox(width: 50,height: 20),
                  Text('2023년 2월 10일 On The Wheel이 세상에 공식적으로 나왔습니다.',style: TextStyle(fontSize: 20),),
                  SizedBox(width: 50,height: 8),
                  Text('On The Wheel은 휠체어를 이용하시거나, 유모차를 사용하시는 교통 약자들의 생활을 조금이나마 편하게 해드리고 싶은 마음에 시작한 서비스입니다.', style: TextStyle(fontSize: 20),),
                  SizedBox(width: 50,height: 8),
                  Text('앱으로서의 역할을 충분히 다하기에는 많이 모자르고 부족하지만, 지속적으로 수정과 업데이트를 거칠 예정입니다. ', style: TextStyle(fontSize: 20),),
                  SizedBox(width: 50,height: 8),
                  Text('많은 관심과 사랑 응원 부탁드립니다.', style: TextStyle(fontSize: 20),),
                  SizedBox(width: 50,height: 60),
                  Text('아직까지 세상은 살아가기에 충분히 따듯한 세상입니다.', style: TextStyle(fontSize: 16),),
                  SizedBox(width: 50,height: 8),
                  Text('Special Thanks to Prof. 황성수', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                ]
          ),
            ),
        ),
      ),
    );
  }
}