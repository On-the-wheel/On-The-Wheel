import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Home.dart';
import 'loginPage.dart';

class PlaceInfo extends StatefulWidget {
  const PlaceInfo({Key? key}) : super(key: key);

  @override
  State<PlaceInfo> createState() => FindPlace();
}

class FindPlace extends State<PlaceInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    IconButton(
                      onPressed: () {
                        Get.off(Home());
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "한동대학교",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "대학교",
                      style:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
                    ),
                    Container(
                      width: 3,
                      height: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        // Get.off(Newplace());
                        Get.off(Login());
                      },
                      icon: Icon(Icons.settings),
                    ),
                  ]),
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 0,
                      ),
                      Container(
                        width: 180,
                        height: 1,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 0,
                      ),
                      Text(
                        "경상북도 포항시 북구 흥해읍 한동로 558",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 0,
                      ),
                      Text(
                        "100km     053-123-456",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 140,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hgu.png'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 400,
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 8,
                height: 1,
              ),
              Container(
                width: 380,
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
          Container(
            width: 400,
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 20,
              ),
              Container(
                width: 90,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/icontoilet.png'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
              ),
              Container(
                width: 90,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/iconsign.png'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
              ),
              Container(
                width: 90,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/iconramp.png'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
              ),
              Container(
                width: 90,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/iconpark.png'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 5,
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
              ),
              Container(
                width: 90,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/iconelevator.png'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
              ),
              Container(
                width: 90,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/iconear.png'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
              ),
              Container(
                width: 90,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/icondoorsill.png'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
              ),
              Container(
                width: 90,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/icondog.png'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 5,
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 8,
                height: 10,
              ),
              Container(
                width: 380,
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
          Container(
            width: 5,
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 20,
              ),
              Container(
                width: 120,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hgu1.jpg'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
              ),
              Container(
                width: 120,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hgu2.png'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
              ),
              Container(
                width: 120,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hgu3.jpeg'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 10,
              ),
            ],
          ),
          Container(
            width: 5,
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 20,
              ),
              Container(
                width: 120,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hgu4.jpeg'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
              ),
              Container(
                width: 120,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hgu5.jpeg'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
              ),
              Container(
                width: 120,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hgu6.jpg'),
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 10,
              ),
            ],
          ),
          Container(
            width: 5,
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 8,
                height: 1
              ),
              Container(
                width: 380,
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: IconButton(
                  onPressed: () {
                    // Get.off(Newplace());
                    Get.off(Login());
                  },
                  icon: Icon(Icons.perm_identity_sharp),
                  iconSize: 35,
                ),
              ),
              Text("이 장소에 대한 후기를 남겨주세요."),
              Row(
                children: [
                  Container(
                    width: 70,
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    color: Colors.yellow,
                    iconSize: 35,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    color: Colors.yellow,
                    iconSize: 35,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    color: Colors.yellow,
                    iconSize: 35,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    color: Colors.yellow,
                    iconSize: 35,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    color: Colors.yellow,
                    iconSize: 35,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 8,
                height: 1,
              ),
              Container(
                width: 380,
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
          Container(
            width: 8,
            height: 5,
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 15,
              ),


              Container(
                width: 375,
                height: 90,
                decoration:  BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.perm_identity_sharp,
                          color: Colors.green,
                          size: 40,
                        ),
                        Text("김민영",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w200)),
                        Container(
                          width: 15,
                          height: 1,
                        ),
                        Container(
                          width: 1,
                          height: 25,
                          color: Colors.black,
                        ),
                        Container(
                          width: 15,
                          height: 1,
                        ),
                        Text(
                          "2022. 1.31",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey),
                        ),
                        Container(
                          width: 55,
                          height: 1,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 20,
                        ),



                      ],
                    ),
                    Text("이동이 편리해요.사람들이 친절하고 다음에도 ...."),
                  ],
                ),
              ),
              Container(
                width: 375,
                height: 90,
                decoration:  BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.perm_identity_sharp,
                          color: Colors.green,
                          size: 40,
                        ),
                        Text("김민영",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w200)),
                        Container(
                          width: 15,
                          height: 1,
                        ),
                        Container(
                          width: 1,
                          height: 25,
                          color: Colors.black,
                        ),
                        Container(
                          width: 15,
                          height: 1,
                        ),
                        Text(
                          "2022. 1.31",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey),
                        ),
                        Container(
                          width: 55,
                          height: 1,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 20,
                        ),



                      ],
                    ),
                    Text("이동이 편리해요.사람들이 친절하고 다음에도 ...."),
                  ],
                ),
              ),

            ],

          ),
        ]),
      ),
    );
  }
}