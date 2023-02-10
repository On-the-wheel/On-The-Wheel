import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'GetPlaceImage.dart';
import 'loginPage.dart';
import 'map/naverMap.dart';
import 'map/newPlace.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Carousel(),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;

  List images = [
    'assets/images/home1.png',
    'assets/images/home2.png',
    'assets/images/home3.png'
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Container(
                color: Colors.white,
                child: Swiper(
                  autoplay: true,
                  scale: 0.9,
                  viewportFraction: 1,
                  pagination:  new SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: new DotSwiperPaginationBuilder(
                        color: Colors.grey, activeColor: Color(0xFFBCCF9B)),
                  ),
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(images[index]);
                  },
                ),
              ),
              flex: 5,
            ),
            Flexible(child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Get.to(NaverMapTest(doorsill: false, runway: false, elevator: false, parking: false, toilet: false,));
                  },
                  icon: Icon(
                    Icons.error,
                    color: Colors.black,
                  ),
                  label: Text(
                    "로그인 없이 이용하기",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(280, 40),
                      backgroundColor: Color(0xFFBFBFBF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
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
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(280, 40),
                      backgroundColor: Color(0xFFBCCF9B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                ),
              ],
            ),
              flex: 1,
            ),

          ],
        ),
      ),
    );
  }
}


