import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onthewheelpractice/map/myPage/version/Version%2023.%202.%201..dart';
import 'package:onthewheelpractice/size.dart';

import 'notice_page.dart';



class MyPage_notice extends StatelessWidget {
  const MyPage_notice({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFBCCF9B),
        title: const Text('공지사항',style: TextStyle(fontSize: 25),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: getScreenWidth(context),
                child: ElevatedButton(onPressed: (){
                  Get.to(Notice_1());
                }, child: Row(
                  children: [
                    Text('On The Wheel 서비스 시작',style: TextStyle(fontSize: 20),),
                    SizedBox(width: 50,),
                    Text('2023.2.10',style: TextStyle(fontSize: 13,color: Colors.grey),),
                  ],
                ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}