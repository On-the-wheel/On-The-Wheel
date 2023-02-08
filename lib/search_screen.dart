import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'map/newPlace.dart';

List<String> category = [];
List<String> detailed_category = [];
List<double> id = [];
List<String> info = [];
List<String> location = [];
List<double> latitude = [];
List<double> longitude = [];
List<String> name = [];
List<int> no = [];
int long = 0;
int count = 0;
int start = 0;
class SearchScreen extends StatefulWidget {
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('place')
            .orderBy('id', descending: false)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          start ++;
          if (start == 1 && snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          long = snapshot.data!.docs.length;
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            var places = snapshot.data!.docs[i];
            name.add(places.get('name'));
            info.add(places.get('info'));
            location.add(places.get('location'));
            latitude.add(places.get('latitude'));
            longitude.add(places.get('longitude'));
            category.add(places.get('category'));
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('On The Wheel'),
              backgroundColor: Colors.lightGreen,
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.pop(context);
                    start = 0;
                    count = 0;
                  },
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back)
              ),
            ),

            body: ListView(
              children: [
                Container(
                  width: 500,
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          focusNode: focusNode,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          autofocus: true,
                          controller: _filter,
                          onTapOutside: (event) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white12,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 20,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _filter.clear();
                                    _searchText = "";
                                  });
                                },
                              )
                          ),
                          textInputAction: TextInputAction.go,
                          onSubmitted: (value)  {
                            setState(() {
                              no.clear();
                              count = 0;
                              for(int i = 0; i < long; i++)
                              {
                                if(name[i].contains(_searchText)){
                                  print(name[i]);
                                  no.add(i);
                                  count++;
                                }
                              }
                              if(count == 0) print('검색 결과 없음');
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                if(count == 0 || _searchText == "")
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100,),
                      Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                        size: 50,
                      ),
                      Text("검색 결과가 없습니다", style: TextStyle(color : Colors.grey, fontSize: 16)),
                      Text("알고 있는 장소가 검색결과에 없다면", style: TextStyle(color : Colors.grey, fontSize: 13)),
                      Text("직접 장소를 등록해보세요!", style: TextStyle(color : Colors.grey, fontSize: 13)),
                      SizedBox(
                          width: 2,
                          height: 15
                      ),
                      Container(
                        child: Center(
                          child: OutlinedButton(
                            onPressed:(){
                              Get.to(Newplace());
                            },
                            child: Text(
                                "신규 장소 등록",
                                style: TextStyle(color : Colors.lightBlue, fontSize: 15, fontWeight: FontWeight.bold,)
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 1.0, color: Colors.lightBlue),
                            ),
                          ),
                          // width: 120,
                          // height: 40,
                          // decoration:  BoxDecoration(
                          //   border: Border.all( color: Colors.lightBlue),
                          // )

                        ),
                      ),
                    ],
                  ),
                if(count > 0 && _searchText != "")
                  for(int i = 0; i < count; i++)
                    Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(height: 4, width: 10),
                              Icon(
                                Icons.room_outlined,
                                size: 40,
                              ),
                              SizedBox(height: 4, width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(name[no[i]],
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.w200)),
                                      SizedBox(height: 1, width:10),
                                      Text(category[no[i]],
                                          style: TextStyle(
                                              fontSize: 10, fontWeight: FontWeight.w200)),
                                    ],
                                  ),
                                  Text(location[no[i]],
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.w200)),
                                ],
                              ),
                              SizedBox(height: 14, width: 15),
                              Divider(thickness: 3, height: 1, color: Colors.grey)
                            ],
                          ),
                        ),
                        SizedBox(height: 5,width: 10),
                        Divider(height: 4, thickness: 0.3, color: Colors.grey),
                        SizedBox(height: 5,width: 10)
                      ],
                    ),
              ], //     _buildBody(context)
            ),
          );

        });
  }
}