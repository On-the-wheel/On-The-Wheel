import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'newPlace.dart';

class AddImages extends StatefulWidget {
  const AddImages({Key? key}) : super(key: key);

  @override
  State<AddImages> createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
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
                      Get.off(Newplace());
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 55),
                  Text("장소 사진 등록",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center)
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 30.0),
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
                              labelText: '출입구 사진(필수 1장 이상)',
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        SizedBox(height: 200),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  SimpleDialog(
                                    children: <Widget>[
                                      SimpleDialogOption(
                                        child: Text('갤러리에서 사진 가져오기'),
                                        onPressed: () async {
                                          var picker = ImagePicker();
                                          var image = await picker.pickImage(source: ImageSource.gallery);
                                        },
                                      ),
                                      SimpleDialogOption(
                                        child: Text('카메라로 사진 촬영하기'),
                                        onPressed: () async {
                                          var picker = ImagePicker();
                                          var image = await picker.pickImage(source: ImageSource.camera);
                                        },
                                      ),
                                    ],
                                  ),
                            );
                          },
                          child: Icon(Icons.add_a_photo, size: 60, color: Colors.grey[600]),
                          style: TextButton.styleFrom(
                              minimumSize: Size(150, 150),
                              backgroundColor: Color(0xffBCCF9B)),

                        )
                      ],
                    ),
                    TextField(
                      decoration:
                      InputDecoration(labelText: '기타 사진'),
                    ),
                    Row(
                      children: [
                        SizedBox(height: 200),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  SimpleDialog(
                                    children: <Widget>[
                                      SimpleDialogOption(
                                        child: Text('갤러리에서 사진 가져오기'),
                                        onPressed: () async {
                                          var picker = ImagePicker();
                                          var image = await picker.pickImage(source: ImageSource.gallery);
                                        },
                                      ),
                                      SimpleDialogOption(
                                        child: Text('카메라로 사진 촬영하기'),
                                        onPressed: () async {
                                          var picker = ImagePicker();
                                          var image = await picker.pickImage(source: ImageSource.camera);
                                        },
                                      ),
                                    ],
                                  ),
                            );
                          },
                          child: Icon(Icons.add_a_photo, size: 60, color: Colors.grey[600]),
                          style: TextButton.styleFrom(
                              minimumSize: Size(150, 150),
                              backgroundColor: Color(0xffBCCF9B)),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  SizedBox(
                    width: 25,
                    height: 150,
                  ),

                  ElevatedButton(
                      onPressed: () {
                        Get.to(Newplace());
                      },
                      child: Text("업로드 완료", style: TextStyle(fontSize: 25, color: Colors.black),),
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
