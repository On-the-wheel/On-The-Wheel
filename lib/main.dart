import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:onthewheelpractice/start_main.dart';

import 'Home.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '7c554cfce76a0344eda0805119e3d3f6');
      runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Start(),
    );
  }
}
