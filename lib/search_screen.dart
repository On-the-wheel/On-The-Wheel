import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('On The Wheel'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            FocusManager.instance.primaryFocus?.unfocus();
            Navigator.pop(context);
          },
          color: Colors.white,
          icon: Icon(Icons.arrow_back)
          ),
        ),


      body: Stack(
        children: <Widget>[
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
                    onTapOutside: (event) =>  FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      suffixIcon: focusNode.hasFocus
                          ? IconButton(
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
                          : Container(),
                      hintText: '검색',
                    ),
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) async{
                        setState(() {

                          _filter.clear();
                          _searchText = "";
                        });
                      },
                  ),
                ),

              ],
            ),
          ),
     //     _buildBody(context)
        ],

      ),

    );
  }

}