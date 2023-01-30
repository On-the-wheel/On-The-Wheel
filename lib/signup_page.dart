import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'loginPage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.off(Login());
                },
                icon: Icon(Icons.arrow_back),
              ),
              SizedBox(
                width: 100,
              ),
              Text(
                "회원가입",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 10.0),
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 1,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '아이디',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("중복확인"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffBCCF9B))),
                    )
                  ],
                ),
                TextField(
                  decoration:
                      InputDecoration(labelText: '비밀번호', hintText: '8자리이상'),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: '비밀번호 확인', hintText: '비밀번호를 한번 더 입력하세요.'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: '닉네임'),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: '이메일', hintText: 'ex)21900099@handong.ac.kr'),
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '휴대폰 번호', hintText: '010-0000-0000'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("인증번호 받기"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffBCCF9B))),
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '인증번호', hintText: '숫자 6개 입력'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("확인"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffBCCF9B))),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 130,
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text("가입", style: TextStyle(fontSize: 25),),
                  style: TextButton.styleFrom(
                      minimumSize: Size(350, 50),
                      backgroundColor: Color(0xffBCCF9B))),
            ],
          )
        ],
      ),
    ));
  }
}
