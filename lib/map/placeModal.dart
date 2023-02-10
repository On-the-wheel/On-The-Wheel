import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size.dart';

class placeModal extends StatefulWidget {
  placeModal(this.name, this.category, this.location, this.info, {Key? key}) : super(key: key);

  String name;
  String category;
  String location;
  String info;

  @override
  State<placeModal> createState() => _placeModalState();
}

class _placeModalState extends State<placeModal> {
  bool star1= false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
  bool star5 = false;

  @override
  Widget build(BuildContext context) {
    var name = widget.name;
    var category = widget.category;
    var location = widget.location;
    var info = widget.info;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 10, 10),
      child: Column(
        children: [
          Container(
            height: getScreenHeight(context) * 0.05,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 1),
          Container(
            height: getScreenHeight(context) * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: getScreenWidth(context) * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(location,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300)),
                      SizedBox(height: getScreenHeight(context) * 0.01),
                      Text("전화번호",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300)),
                      SizedBox(height: getScreenHeight(context) * 0.01),
                      Text("내 위치로부터 거리계산",
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
                        image: AssetImage('assets/images/hgu.png'), scale: 1),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1),
          iconMaker(info, context),
          Divider(thickness: 1,),
          Container(
            height: getScreenHeight(context)*0.2,
            child: ListView(
              children: [
                Container(
                  child:Image.asset("assets/images/hgu.png", ),
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.1,
                ),
                Container(
                  child:Image.asset("assets/images/hgu.png", ),
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.1,
                ),
                Container(
                  child:Image.asset("assets/images/hgu.png", ),
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.1,
                ),
              ],
            ),
          ),
          Divider(thickness: 1,),
          Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.person_alt_circle_fill)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("이 장소에 대한 후기를 남겨주세요")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          star1 = true;
                          star2 = false;
                          star3 = false;
                          star4 = false;
                          star5 = false;
                          setState(() {

                          });

                        },
                        icon: Icon(Icons.star),
                        color: star1? Colors.yellowAccent: Colors.grey,
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () {
                          star1 = true;
                          star2 = true;
                          star3 = false;
                          star4 = false;
                          star5 = false;
                          setState(() {

                          });
                        },
                        icon: Icon(Icons.star),
                        color: star2? Colors.yellowAccent: Colors.grey,
                        iconSize: 35,
                      ),IconButton(
                        onPressed: () {
                          star1 = true;
                          star2 = true;
                          star3 = true;
                          star4 = false;
                          star5 = false;
                          setState(() {

                          });
                        },
                        icon: Icon(Icons.star),
                        color: star3? Colors.yellowAccent: Colors.grey,
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () {
                          star1 = true;
                          star2 = true;
                          star3 = true;
                          star4 = true;
                          star5 = false;
                          setState(() {

                          });
                        },
                        icon: Icon(Icons.star),
                        color: star4? Colors.yellowAccent: Colors.grey,
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () {
                          star1 = true;
                          star2 = true;
                          star3 = true;
                          star4 = true;
                          star5 = true;
                          setState(() {

                          });
                        },
                        icon: Icon(Icons.star),
                        color: star5? Colors.yellowAccent: Colors.grey,
                        iconSize: 35,
                      ),
                    ],
                  ),
                  Divider(thickness: 1,),

                ],
              )
          )



        ],
      ),
    );
  }
}
//
// import 'dart:core';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:onthewheelpractice/size.dart';

// class placeModal extends StatefulWidget {
//   placeModal(this.name, this.category, this.location, this.info, {Key? key})
//       : super(key: key);
//   String name;
//   String category;
//   String location;
//   String info;
//
//   @override
//   Widget build(BuildContext context) {
//     bool star1= false;
//     bool star2 = false;
//     bool star3 = false;
//     bool star4 = false;
//     bool star5 = false;
//
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
//       child: Column(
//         children: [
//           Container(
//             height: getScreenHeight(context) * 0.05,
//             child: Row(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       name,
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: 10),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       category,
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Divider(thickness: 1),
//           Container(
//             height: getScreenHeight(context) * 0.15,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   width: getScreenWidth(context) * 0.5,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(location,
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.w300)),
//                       SizedBox(height: getScreenHeight(context) * 0.01),
//                       Text("전화번호",
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.w300)),
//                       SizedBox(height: getScreenHeight(context) * 0.01),
//                       Text("내 위치로부터 거리계산",
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.w300)),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: getScreenWidth(context) * 0.4,
//                   height: getScreenWidth(context),
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/images/hgu.png'), scale: 1),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Divider(thickness: 1),
//           iconMaker(info, context),
//           Divider(thickness: 1,),
//           Container(
//             height: getScreenHeight(context)*0.2,
//             child: ListView(
//               children: [
//                 Container(
//                   child:Image.asset("assets/images/hgu.png", ),
//                   width: MediaQuery.of(context).size.width*0.3,
//                   height: MediaQuery.of(context).size.height*0.1,
//                 ),
//                 Container(
//                     child:Image.asset("assets/images/hgu.png", ),
//                     width: MediaQuery.of(context).size.width*0.3,
//                   height: MediaQuery.of(context).size.height*0.1,
//                 ),
//                 Container(
//                     child:Image.asset("assets/images/hgu.png", ),
//                     width: MediaQuery.of(context).size.width*0.3,
//                   height: MediaQuery.of(context).size.height*0.1,
//                 ),
//               ],
//             ),
//           ),
//           Divider(thickness: 1,),
//           Container(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(CupertinoIcons.person_alt_circle_fill)
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("이 장소에 대한 후기를 남겨주세요")
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         star1 = true;
//                         star2 = false;
//                         star3 = false;
//                         star4 = false;
//                         star5 = false;
//
//                       },
//                       icon: Icon(Icons.star),
//                       color: star1? Colors.yellowAccent: Colors.grey,
//                       iconSize: 35,
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         star1 = true;
//                         star2 = true;
//                         star3 = false;
//                         star4 = false;
//                         star5 = false;
//                       },
//                       icon: Icon(Icons.star),
//                       color: star2? Colors.yellowAccent: Colors.grey,
//                       iconSize: 35,
//                     ),IconButton(
//                       onPressed: () {
//                         star1 = true;
//                         star2 = true;
//                         star3 = true;
//                         star4 = false;
//                         star5 = false;
//                       },
//                       icon: Icon(Icons.star),
//                       color: star3? Colors.yellowAccent: Colors.grey,
//                       iconSize: 35,
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         star1 = true;
//                         star2 = true;
//                         star3 = true;
//                         star4 = true;
//                         star5 = false;
//                       },
//                       icon: Icon(Icons.star),
//                       color: star4? Colors.yellowAccent: Colors.grey,
//                       iconSize: 35,
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         star1 = true;
//                         star2 = true;
//                         star3 = true;
//                         star4 = true;
//                         star5 = true;
//                       },
//                       icon: Icon(Icons.star),
//                       color: star5? Colors.yellowAccent: Colors.grey,
//                       iconSize: 35,
//                     ),
//
//                   ]
//                 )
//               ],
//             )
//           )
//
//
//
//         ],
//       ),
//     );
//   }

SizedBox iconMaker(String s, BuildContext context) {
  List<String> result = s.split(',');
  List<Icon> Icondata = []; //

  return SizedBox(
    height: getScreenHeight(context) * 0.10,
    child: ListView(
        scrollDirection: Axis.horizontal, children: getList(result, context)),
  );
}

List<Widget> getList(List<String> result, BuildContext context) {
  List<Widget> childs = [];
  for (int i = 0; i < result.length; i++) {
    print(result[i]);
    if (result[i] == "문턱 없음") {
      childs.add(makeIcon(
          Icon(Icons.sensor_door_outlined,
              size: getScreenHeight(context) * 0.06,
              color: Colors.lightGreen),
          "문턱 없음",
          context));
      childs.add(SizedBox(width: 15));
    } else if (result[i] == "문턱 있음") {
      childs.add(makeIcon(
          Icon(Icons.door_front_door_outlined,
              size: getScreenHeight(context) * 0.06,
              color: Colors.lightGreen),
          "문턱 있음",
          context));
      childs.add(SizedBox(width: 15));
    } else if (result[i] == "안내견 출입가능") {
      childs.add(makeIcon(
          Icon(Icons.pets,
              size: getScreenHeight(context) * 0.06,
              color: Colors.lightGreen),
          " 안내견 \n출입가능",
          context));
      childs.add(SizedBox(width: 15));
    } else if (result[i] == "주출입구 높이차이 제거" || result[i] == "경사로") {
      childs.add(makeIcon(
          Icon(Icons.signal_cellular_4_bar,
              size: getScreenHeight(context) * 0.06,
              color: Colors.lightGreen),
          "경사로",
          context));
      childs.add(SizedBox(width: 15));
    } else if (result[i] == "주출입구 접근로") {
      childs.add(makeIcon(
          Icon(Icons.accessible,
              size: getScreenHeight(context) * 0.06,
              color: Colors.lightGreen),
          "주출입구\n  접근로",
          context));
      childs.add(SizedBox(width: 15));
    } else if (result[i] == "계단 또는 승강설비") {
      childs.add(makeIcon(
          Icon(Icons.elevator,
              size: getScreenHeight(context) * 0.06,
              color: Colors.lightGreen),
          "   장애인\n엘리베이터",
          context));
      childs.add(SizedBox(width: 15));
    } else if (result[i] == "장애인전용주차구역") {
      childs.add(makeIcon(
          Icon(Icons.local_parking,
              size: getScreenHeight(context) * 0.06,
              color: Colors.lightGreen),
          "   장애인\n전용주차장",
          context));
      childs.add(SizedBox(width: 15));
    } else if (result[i] == "소변기") {
      childs.add(makeIcon(
          Icon(Icons.water,
              size: getScreenHeight(context) * 0.06,
              color: Colors.lightGreen),
          " 장애인 \n 소변기",
          context));
      childs.add(SizedBox(width: 15));
    } else if (result[i] == "대변기") {
      childs.add(makeIcon(
          Icon(CupertinoIcons.tornado,
              size: getScreenHeight(context) * 0.06,
              color: Colors.lightGreen),
          " 장애인 \n 대변기 ",
          context));
      childs.add(SizedBox(width: 15));
    } else if (result[i] == "1층에 위치") {
      childs.add(makeIcon(
          Icon(Icons.looks_one,
              size: getScreenHeight(context) * 0.06,
              color: Colors.lightGreen),
          "1층 위치",
          context));
      childs.add(SizedBox(width: 15));
    }
  }

  return childs;
}

SizedBox makeIcon(Icon icon, String name, BuildContext context) {
  return SizedBox(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(strokeAlign: 1.0, color: Colors.lightGreen),
        borderRadius: BorderRadius.circular(10),
      ),
      height: getScreenHeight(context) * 0.13,
      width: getScreenWidth(context) * 0.13,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Text(
            name,
            style: TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.w500,
              fontSize: getScreenWidth(context) * 0.02,
            ),
          )
        ],
      ),
    ),
  );
}

