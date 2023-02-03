import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onthewheelpractice/size.dart';

class placeModal extends StatelessWidget {
  placeModal(this.name, this.category, this.location, this.info, {Key? key}) : super(key: key);
  String name;
  String category;
  String location;
  String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: getScreenWidth(context)*0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name,style: TextStyle(fontSize:20, fontWeight: FontWeight.w600),),
                        SizedBox(width: 10),

                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(category, style: TextStyle(fontSize:12, fontWeight: FontWeight.w600,color: Colors.grey ),),
                        ),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Divider(thickness: 1),
                    SizedBox(height: 3),
                    Text(location, style: TextStyle(fontSize:15, fontWeight: FontWeight.w300)),
                    SizedBox(height: 5),
                    Text("전화번호 + 내 위치로부터 거리계산", style: TextStyle(fontSize:15, fontWeight: FontWeight.w300)),
                    SizedBox(height: 10),
                    Divider(thickness: 1,),
                  ],
                ),
              ),
              //사진!!!!!!!!!!!!!!!!!!!!!!!
              SizedBox(width: getScreenWidth(context)*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getScreenWidth(context)*0.35,
                    height: getScreenHeight(context)*0.2,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/hgu.png'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),


        ],
      ),
    );
  }
}
