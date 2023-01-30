import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Home.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBCCF9B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("   On The Wheel",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700,color: Colors.white),)
        ],
      ),
    );
  }

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Get.to(Home());
    });
  }
}

