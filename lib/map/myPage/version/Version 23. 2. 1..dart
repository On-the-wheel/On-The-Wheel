import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Version23_2_1 extends StatelessWidget {
  const Version23_2_1({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFBCCF9B),
        title: const Text('Version 23. 2. 1.', style: TextStyle(fontSize: 25),),
      ),

      body: SafeArea(
        child: SingleChildScrollView(

          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
                children: [
                  SizedBox(width: 50, height: 5,),
                  Text('Version 23. 2. 1. 변경사항',style: TextStyle(fontSize: 30),),
                  SizedBox(width: 50,height: 30),
                  Text('1. On The Wheel 서비스 시작',style: TextStyle(fontSize: 20),),
                  SizedBox(width: 50,height: 300),
                  Text('학회장',style: TextStyle(fontSize: 15),),
                  SizedBox(width: 50,height: 10),
                  Text('21 강정희',style: TextStyle(fontSize: 15),),
                  SizedBox(width: 50,height: 25),
                  Text('백 엔드',style: TextStyle(fontSize: 15),),
                  SizedBox(width: 50,height: 10),
                  Text('18 구현우, 19 김범진, 19 김완, 21 강정희, 21 이다정',style: TextStyle(fontSize: 15),),
                  SizedBox(width: 50,height: 25),
                  Text('프론트 엔드',style: TextStyle(fontSize: 15),),
                  SizedBox(width: 50,height: 10),
                  Text('19 김민영, 19 김필겸, 19 박승리, 19 박정훈',style: TextStyle(fontSize: 15),),
                  SizedBox(width: 50,height: 10),
                ]
            ),
          ),
        ),
      ),
    );
  }
}