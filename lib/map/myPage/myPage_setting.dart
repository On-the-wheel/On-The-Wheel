import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size.dart';

class MyPage_Setting extends StatelessWidget {
  const MyPage_Setting({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFBCCF9B),
        title: const Text('설정',style: TextStyle(fontSize: 25),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: getScreenWidth(context),
                child: ElevatedButton(onPressed: (){}, child: Row(
                  children: [
                    Text('회원정보 수정',style: TextStyle(fontSize: 20),),
                    SizedBox(width: 130,)
                  ],
                ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                      alignment: Alignment.centerLeft,side: BorderSide.none),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}