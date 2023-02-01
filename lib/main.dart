import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onthewheelpractice/start_main.dart';

import 'Home.dart';

// void main() {
//   runApp( MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // 데이터를 받아올때까지 실행시켜줄때까지 기다려주겠다
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp(super.key});

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
