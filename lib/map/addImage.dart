import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onthewheelpractice/map/newPlace.dart';

import '../size.dart';

class AddImages extends StatefulWidget {
  const AddImages({Key? key}) : super(key: key);

  @override
  State<AddImages> createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList = [];
  List<XFile>? _imageFileList2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("장소 사진 등록"),
          titleTextStyle: TextStyle(fontSize: 24, color: Colors.black),
          centerTitle: true,
          backgroundColor: Color(0xffbccf9b),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "출입구 사진",
                          style: TextStyle(fontSize: 19, color: Colors.black),
                        ),
                        Text(
                          '*',
                          style: TextStyle(fontSize: 17, color: Colors.red),
                        ),
                        Text(
                          "(1장 필수)",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => SimpleDialog(
                            children: <Widget>[
                              SimpleDialogOption(
                                child: Row(
                                  children: [
                                    Icon(Icons.photo,size: 30,),
                                    Text(' 앨범에서 사진 가져오기',style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                onPressed: () async {
                                  selectImage();
                                  Navigator.pop(context);
                                },
                              ),
                              SimpleDialogOption(
                                child: Row(
                                  children: [
                                    Icon(Icons.photo_camera,size: 30,),
                                    Text(' 카메라로 사진 촬영하기',style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                onPressed: () async {
                                  takeImage();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Divider(thickness: 1, height: 1, color: Colors.black),
              ),
              _imageFileList!.length > 0
                  ? Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 15, 0),
                child: Container(
                  height: 270,
                  width: getScreenWidth(context),
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _imageFileList!.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: getScreenWidth(context)),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                            File(_imageFileList![index].path),
                            fit: BoxFit.fill),
                      );
                    },
                  ),
                ),
              )
                  : Container(
                height: 250,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "기타 사진",
                      style: TextStyle(fontSize: 19, color: Colors.black),
                    ),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => SimpleDialog(
                              children: <Widget>[
                                SimpleDialogOption(
                                  child: Row(
                                    children: [
                                      Icon(Icons.image,size: 30,),
                                      Text(' 앨범에서 사진 가져오기',style: TextStyle(fontSize: 18),),
                                    ],
                                  ),
                                  onPressed: () async {
                                    selectImage1();
                                    Navigator.pop(context);
                                  },
                                ),
                                SimpleDialogOption(
                                  child: Row(
                                    children: [
                                      Icon(Icons.photo_camera,size: 30,),
                                      Text(' 카메라로 사진 촬영하기',style: TextStyle(fontSize: 18),),
                                    ],
                                  ),
                                  onPressed: () async {
                                    takeImage1();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.add_a_photo,
                          size: 30,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Divider(thickness: 1, height: 1, color: Colors.black),
              ),
              _imageFileList2!.length > 0
                  ? Container(
                height: _imageFileList2!.length % 2 == 0
                    ? _imageFileList2!.length * 100
                    : (_imageFileList2!.length + 1) * 100,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: GridView.builder(
                    itemCount: _imageFileList2!.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                            File(_imageFileList2![index].path),
                            fit: BoxFit.cover),
                      );
                    },
                  ),
                ),
              )
                  : Container(
                height: 10,
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  height: 70,
                  width: getScreenWidth(context),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_imageFileList!.length > 0) {
                          Get.to(Newplace());
                        }
                      },
                      child: Text(
                        "완료",
                        style: TextStyle(color: Colors.black, fontSize: 19),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _imageFileList!.length != 0
                              ? Color(0xffbccf9b)
                              : Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  void selectImage() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      _imageFileList?.addAll(selectedImages);
    }

    print("Image List Length: " + _imageFileList!.length.toString());
    setState(() {});
  }

  void takeImage() async {
    final XFile? takeImages =
    await _picker.pickImage(source: ImageSource.camera);
    if (takeImages != null) {
      _imageFileList?.add(takeImages);
    }
    setState(() {});
  }

  void selectImage1() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      _imageFileList2?.addAll(selectedImages);
    }

    print("Image List Length: " + _imageFileList2!.length.toString());
    setState(() {});
  }

  void takeImage1() async {
    final XFile? takeImages =
    await _picker.pickImage(source: ImageSource.camera);
    if (takeImages != null) {
      _imageFileList2?.add(takeImages);
    }
    setState(() {});
  }
}
