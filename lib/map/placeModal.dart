import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onthewheelpractice/size.dart';

class placeModal extends StatelessWidget {
  placeModal(this.name, this.category, this.location, this.info, {Key? key})
      : super(key: key);
  String name;
  String category;
  String location;
  String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
      child: ListView(
        children: [
          Container(
            height: getScreenHeight(context) * 0.05,
            child: Row(
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    category,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),

            // mainAxisAlignment: MainAxisAlignment.start,
            // children: [
            //   Container(
            //     width: getScreenWidth(context) * 0.5,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           children: [
            //             Text(
            //               name,
            //               style: TextStyle(
            //                   fontSize: 20, fontWeight: FontWeight.w600),
            //             ),
            //             SizedBox(width: 10),
            //             Padding(
            //               padding: const EdgeInsets.only(top: 5.0),
            //               child: Text(
            //                 category,
            //                 style: TextStyle(
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.w600,
            //                     color: Colors.grey),
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(
            //           height: 3,
            //         ),
            //         Divider(thickness: 1),
            //         SizedBox(height: 3),
            //         Text(location,
            //             style: TextStyle(
            //                 fontSize: 15, fontWeight: FontWeight.w300)),
            //         SizedBox(height: 5),
            //         Text("전화번호 + 내 위치로부터 거리계산",
            //             style: TextStyle(
            //                 fontSize: 15, fontWeight: FontWeight.w300)),
            //         SizedBox(height: 10),
            //         Divider(
            //           thickness: 1,
            //         ),
            //       ],
            //
            //   ),
            //   //사진!!!!!!!!!!!!!!!!!!!!!!!
            //   SizedBox(
            //     width: getScreenWidth(context) * 0.05,
            //   ),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Container(
            //         width: getScreenWidth(context) * 0.35,
            //         height: getScreenHeight(context) * 0.2,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: AssetImage('assets/images/hgu.png'),
            //           ),
            //         ),
            //       ),
            //     ],
            //   )
            // ],
          ),
          Divider(thickness: 1),
          Container(
            height: getScreenHeight(context) * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: getScreenHeight(context) * 0.2,
                  width: getScreenWidth(context) * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: getScreenHeight(context)*0.05,),
                      Text(location,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300)),
                      SizedBox(height: 5),
                      Text("전화번호 + 내 위치로부터 거리계산",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                Container(
                  width: getScreenWidth(context) * 0.4,
                  height: getScreenWidth(context),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/hgu.png'),
                      scale: 1
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1),
          iconMaker(info, context)
        ],
      ),
    );
  }

  Container iconMaker(String s, BuildContext context) {
    List<String> result = s.split(',');
    List<Icon> Icondata = []; //

    return Container(
      width: getScreenWidth(context),
      height: getScreenHeight(context) * 0.05,
      child:
          ListView(scrollDirection: Axis.horizontal, children: getList(result)),
    );
  }

  List<Widget> getList(List<String> result) {
    List<Widget> childs = [];
    for (int i = 0; i < result.length; i++) {
      print(result[i]);
      if (result[i] == "문턱 없음") {
        childs.add(Icon(
          Icons.sensor_door_outlined,
          size: 35,
        ));
        childs.add(SizedBox(width: 15));
      } else if (result[i] == "문턱 있음") {
        childs.add(Icon(Icons.door_front_door_outlined, size: 35));
        childs.add(SizedBox(width: 15));
      } else if (result[i] == "주출입구 접근로") {
        childs.add(Icon(Icons.circle_outlined, size: 35));
        childs.add(SizedBox(width: 15));
      } else if (result[i] == "주출입구 높이차이 제거") {
        childs.add(Icon(CupertinoIcons.arrow_up_right, size: 35));
        childs.add(SizedBox(width: 15));
      } else if (result[i] == "계단 또는 승강설비") {
        childs.add(Icon(Icons.elevator, size: 35));
        childs.add(SizedBox(width: 15));
      } else if (result[i] == "장애인전용주차구역") {
        childs.add(Icon(Icons.local_parking, size: 35));
        childs.add(SizedBox(width: 15));
      } else if (result[i] == "소변기") {
        childs.add(Icon(Icons.water, size: 35));
        childs.add(SizedBox(width: 15));
      } else if (result[i] == "대변기") {
        childs.add(Icon(CupertinoIcons.tortoise, size: 35));
        childs.add(SizedBox(width: 15));
      } else if (result[i] == "1층에 위치") {
        childs.add(Icon(Icons.numbers, size: 35));
        childs.add(SizedBox(width: 15));
      }
    }

    return childs;
  }

  Container makeIcon(IconData icon, String name) {
    return Container();
  }
}
