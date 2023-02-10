import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../size.dart';
import 'Version/Version 23. 2. 1..dart';

class Version extends StatelessWidget {
  const Version({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFBCCF9B),
        title: const Text('Version', style: TextStyle(fontSize: 25),),
      ),

      body: SafeArea(
        child: SingleChildScrollView(

          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
                children: [
                  SizedBox(width: 50, height: 5,),
                  ListTile(
                    title: Text('Version 23. 2. 1.'),
                    onTap: () {
                      Get.to(Version23_2_1());
                    },
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}