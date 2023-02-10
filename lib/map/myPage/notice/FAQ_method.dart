import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQ_Method extends StatefulWidget {
  const FAQ_Method({Key? key}) : super(key: key);

  @override
  State<FAQ_Method> createState() => _FAQ_MethodState();
}

class _FAQ_MethodState extends State<FAQ_Method> {
  String _enteredText = '';
  final List<String> _placeList = ['시스템 오류', '장소 등록 오류', '문제1','문제2 ','문제3'];
  String _selectedValue = '시스템 오류';
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFBCCF9B),
        title: const Text('문의하기',style: TextStyle(fontSize: 22),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text(
                            '답변 받으실 이메일',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )
                        ),
                      )
                    ]
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10,0, 25, 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email_outlined),
                        hintText: 'ex) microlearnable@gmail.com',
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Text(
                              '문의 유형',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              )
                          ),
                        )
                      ]
                  ),
                  Container(
                    width: 360,
                    height: 50,
                    child: DropdownButton(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        isExpanded: true,
                        value: _selectedValue,
                        items: _placeList.map((String item) {
                          return DropdownMenuItem<String>(
                              child: Text('$item'), value: item);
                        }).toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        }),
                  ),

                  Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                              '문의 내용',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              )
                          ),
                        )
                      ]
                  ),
                  SizedBox(
                      height: 5
                  ),
                  SizedBox(
                    width: 367,
                    child: TextField(
                      maxLines: 10,
                      controller: _titleController,
                      cursorColor: Color(0xFFBCCF9B),
                      onChanged: (value) {
                        setState(() {
                          _enteredText = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.grey)
                          ),
                          // Display the number of entered characters
                          counterText: '${_enteredText.length.toString()} /1500'),
                    ),
                  ),

                  SizedBox(
                      height: 120
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: SizedBox(
                        height: 60,
                        width: 360,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: Text(
                            "완료",
                            style: TextStyle(fontSize: 25),
                          ),
                          style: ElevatedButton.styleFrom(backgroundColor: Color(0xffbccf9b)),
                        ),
                      ),
                    ),
                  ),


            ]
            )
          ),
        ),
      )
    );
  }
}
