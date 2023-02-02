import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onthewheelpractice/signup_page.dart';

import 'Home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          color: Color(0xffbccf9b),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              IconButton(onPressed: (){
                Get.off(Home());
              }, icon: Icon(Icons.arrow_back)),
              SizedBox(height: 50,),
              Text(
                "   On The Wheel",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 220,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle,size: 35,color: Colors.black,),
                        hintText: '아이디',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.white70
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 5),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,size: 35,color: Colors.black,),
                          hintText: '비밀번호',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white70
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  SizedBox(
                    width: 43,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "아이디 찾기",
                        style: TextStyle(color: Color(1761607680)),
                      )),
                  Text(
                    "|",
                    style: TextStyle(color: Color(1761607680)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "비밀번호 찾기",
                        style: TextStyle(color: Color(1761607680)),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "로그인",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.chat_bubble,color: Color(0xff9D6F45),),
                      label: Text(
                        "카카오톡",
                        style: TextStyle(fontSize: 20,color: Color(0xff9D6F45),),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Color(0xffFFF38A)))),
                  SizedBox(width: 20,),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.language,color: Colors.black,),
                      label: Text(
                        "Google",
                        style: TextStyle(fontSize: 20,color: Colors.black,),
                      ),
                      style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white))
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 70,),
                  Text("아직 회원이 아니세요?     |   ",style: TextStyle(color: Color(0x69000000)),),
                  TextButton(onPressed: (){
                    Get.to(SignUp());
                  },
                      child: Text("회원가입",style: TextStyle(color: Colors.red,fontSize: 17),)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
