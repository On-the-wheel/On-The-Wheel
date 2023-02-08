import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'firebase_options.dart';
import 'loginPage.dart';

int start = 0;
int id_check = 0;
int email_check = 0;
int nick_check = 0;
List<String> ids = [];
List<String> emails = [];
List<String> nicknames = [];

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Login());
}

renderTextFormField({
  required String label,
  required FormFieldSetter onSaved,
  required FormFieldValidator validator,
}) {
  assert(onSaved != null);
  assert(validator != null);
  return Column(
    children: [
      Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      TextFormField(
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        onSaved: onSaved,
        validator: validator,
      ),
      Container(height: 5),
    ],
  );
}

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int check = 0;
  int checks = 0;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String email = '';
  String password = '';
  String password_check = '';
  String nickname = '';

  @override
  Widget build(BuildContext context) {
    print(id);
    print(password);
    print(nickname);
    print(email);
    final firestore = FirebaseFirestore.instance;

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('member')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          start ++;
          if (start == 1 && snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          int long = snapshot.data!.docs.length;
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            var member = snapshot.data!.docs[i];
            ids.add(member.get('id'));
            nicknames.add(member.get('nickname'));
            emails.add(member.get('email'));
          }
          return Scaffold(
            body: SingleChildScrollView(
                child: Form(
                  key: this._formKey,
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
                              FocusManager.instance.primaryFocus?.unfocus();
                              ids.clear();
                              emails.clear();
                              nicknames.clear();
                              Get.off(Login());
                              start = 0;
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Text(
                            "회원가입",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 20.0),
                        child: Column(
                          children: [
                            Container(
                              width: 500,
                              height: 1,
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                SizedBox(height: 80),
                                Flexible(
                                  child: renderTextFormField(
                                    label: '아이디',
                                    onSaved: (val) {
                                      setState(() {
                                        this.id = val;
                                      });
                                    },
                                    validator: (val) {
                                      if (val.length < 1) {
                                        return '아이디는 필수사항입니다.';
                                      }

                                      if (check == 2) {
                                        check = 0;
                                        return '사용할 수 없는 아이디입니다..';
                                      }
                                      return null;
                                    },

                                  ),
                                ),

                              ],
                            ),
                            renderTextFormField(
                              label: '비밀번호',
                              onSaved: (val) {
                                setState(() {
                                  this.password = val;
                                });
                              },
                              validator: (val) {
                                if (val.length < 1) {
                                  return '비밀번호는 필수입니다';
                                }
                                return null;
                              },

                            ),

                            renderTextFormField(
                              label: '비밀번호 확인',
                              onSaved: (val) {
                                setState(() {
                                  this.password_check = val;
                                });
                              },
                              validator: (val) {
                                if (val.length < 1) {
                                  return '비밀번호 확인은 필수입니다';
                                }
                                return null;
                              },

                            ),
                            renderTextFormField(
                              label: '닉네임',
                              onSaved: (val) {
                                setState(() {
                                  this.nickname = val;
                                });
                              },
                              validator: (val) {
                                if (val.length < 1) {
                                  return '닉네임은 필수입니다';
                                }
                                return null;
                              },

                            ),
                            renderTextFormField(
                              label: '이메일',
                              onSaved: (val) {
                                setState(() {
                                  this.email = val;
                                });
                              },
                              validator: (val) {
                                if(val.length < 1) {
                                  return '이메일은 필수사항입니다.';
                                }

                                if(!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(val)){
                                  return '잘못된 이메일 형식입니다.';
                                }

                                return null;
                              },
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: '휴대폰 번호',
                                        hintText: '010-0000-0000'),
                                  ),
                                ),
                                Container(
                                  width: 115,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("인증번호 받기"),
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Color(0xffBCCF9B))),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: '인증번호',
                                        hintText: '숫자 6개 입력'),
                                  ),
                                ),
                                Container(
                                  width: 115,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                      }
                                    },
                                    child: Text("확인"),
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Color(0xffBCCF9B))),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                check = 0;
                                this._formKey.currentState!.save();
                                if (this._formKey.currentState!.validate()) {
                                  for(int i = 0; i < long; i++)
                                  {
                                    if(ids[i] == this.id)
                                    {
                                      id_check = 1;
                                      break;
                                    }
                                    else if(nicknames[i] == this.nickname)
                                    {
                                      id_check = 0;
                                      nick_check = 1;
                                      break;
                                    }
                                    else if(emails[i] == this.email)
                                    {
                                      id_check = 0;
                                      nick_check = 0;
                                      email_check = 1;
                                      break;
                                    }
                                    else
                                    {
                                      id_check = 0;
                                      email_check = 0;
                                      nick_check = 0;
                                    }
                                  }


                                  if(id_check == 0 && email_check == 0 && nick_check == 0)
                                  {
                                    firestore.collection('member').add({'email' : this.email, 'id' : this.id, 'nickname' : this.nickname, 'password' : this.password});
                                    Get.snackbar(
                                      '가입완료!',
                                      '가입이 완료되었습니다!',
                                      backgroundColor: Colors.lightGreen,
                                    );

                                    Get.to(Login());
                                  }
                                  else if(id_check == 1)
                                  {
                                    Get.snackbar(
                                      '아이디 중복!',
                                      '아이디가 중복됩니다!',
                                      backgroundColor: Colors.redAccent,
                                    );
                                  }
                                  else if(this.password != this.password_check)
                                  {
                                    Get.snackbar(
                                      '비밀번호 불일치!',
                                      '비밀번호를 다시 확인해주세요!',
                                      backgroundColor: Colors.redAccent,
                                    );
                                  }
                                  else if(nick_check == 1)
                                  {
                                    Get.snackbar(
                                      '닉네임 중복!',
                                      '닉네임이 중복됩니다!',
                                      backgroundColor: Colors.redAccent,
                                    );
                                  }
                                  else if(email_check == 1)
                                  {
                                    Get.snackbar(
                                      '이메일 중복!',
                                      '이메일이 중복됩니다!',
                                      backgroundColor: Colors.redAccent,
                                    );
                                  }
                                }
                              },
                              child: Text("가입", style: TextStyle(
                                  fontSize: 25),),
                              style: TextButton.styleFrom(
                                  minimumSize: Size(350, 50),
                                  backgroundColor: Color(0xffBCCF9B))),
                        ],
                      )
                    ],
                  ),
                )),

          );
        });
  }
}
