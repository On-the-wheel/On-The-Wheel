import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../loginPage.dart';
import '../placeinfo.dart';

class Review extends StatefulWidget {
  const Review({Key? key, required this.count}) : super(key: key);

  final count;

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    double number = widget.count;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.off(PlaceInfo());
                      },
                      child: Text("취소",style: TextStyle(color: Colors.black),),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '한동대학교 도서관',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(onPressed: () {}, child: Text("확인",style: TextStyle(color: Colors.black),))
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Column(
                  children: [
                    RatingBar.builder(
                      initialRating: number,
                      minRating: 0.5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) =>setState(() {
                        this.rating = rating;
                      })
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '$rating',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  height: 300,
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.multiline,
                    minLines: 40,
                    //text박스의 최소 크기// 좀 줄이면 border를 없앤 것이 티가 난다
                    maxLines: 100,
                    decoration: InputDecoration(
                        border: InputBorder.none, //중간에 줄 없애는 것
                        hintText:
                            "작상한 후기는 다른 사용자들이 볼 수 있으니, 서로를 배려하는 마음을 담아 작성해 주세요."),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
