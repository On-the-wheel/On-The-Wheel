import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size.dart';

class MyPage_FAQ extends StatelessWidget {
  const MyPage_FAQ({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFBCCF9B),
        title: const Text('자주 묻는 질문(FAQ)',style: TextStyle(fontSize: 23),),
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
                    Text('장소등록 하는 법',style: TextStyle(fontSize: 20),),
                    SizedBox(width: 130,),
                    Text('2023.2.10',style: TextStyle(fontSize: 13,color: Colors.grey),),
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