import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'GetPlaceImage.dart';
import 'loginPage.dart';
import 'map/MapProvider.dart';
import 'map/naverMap.dart';
import 'map/newPlace.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewWidget(),
    );
  }
}

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller =
    PageController(initialPage: 0, viewportFraction: 1);

    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                Text('안녕하세요.',style: TextStyle(fontSize: 40),),
                Text('지금가고 싶은 그곳의',style: TextStyle(fontSize: 30),),
                Text('정보를 제공하고 있습니다.',style: TextStyle(fontSize: 30),),
                Text('\n',style: TextStyle(fontSize: 40),),
                SizedBox(height: 200,),
                LoginIcon(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lens,size: 15,color: Colors.black,),
                    Icon(Icons.lens,size: 15,color: Colors.grey,),
                    Icon(Icons.lens,size: 15,color: Colors.grey,),
                  ],
                ),
              ],
            ),
          ),

        Container(
          color: Colors.orangeAccent.withOpacity(0.5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('두 번째 페이지',style: TextStyle(fontSize: 50),),
                LoginIcon(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lens,size: 15,color: Colors.grey,),
                    Icon(Icons.lens,size: 15,color: Colors.black,),
                    Icon(Icons.lens,size: 15,color: Colors.grey,),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.cyanAccent.withOpacity(0.5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('세 번째 페이지',style: TextStyle(fontSize: 50),),
                LoginIcon(),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lens,size: 15,color: Colors.grey,),
                    Icon(Icons.lens,size: 15,color: Colors.grey,),
                    Icon(Icons.lens,size: 15,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoginIcon extends StatelessWidget {
  const LoginIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Get.to(NaverMapTest(mapProvider: MapProvider(),));
          },
          icon: Icon(
            Icons.error,
            color: Colors.black,
          ),
          label: Text(
            "로그인 없이 이용하기",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
        ),
        ElevatedButton.icon(
          onPressed: () {
            Get.to(Login());
          },
          icon: Icon(
            Icons.login,
            color: Colors.black,
          ),
          label: Text(
            "로그인 후 이용하기",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}

