import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

Widget numberInsert(
    {
      bool? editAble,
      String? hintText,
      FocusNode? focusNode,
      TextEditingController? controller,
      required TextInputAction textInputAction,
      Function? widgetFunction,
      int? maxLegnth,

    }){
  return TextFormField(
    enabled: editAble,
    style: TextStyle(
      fontSize: 12,
    ),
    decoration: InputDecoration(
      contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      isDense: true,
      counterText: "",
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),

    textInputAction: textInputAction,
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly,],
    focusNode:focusNode,
    controller: controller,
    maxLength: maxLegnth,
    onChanged: (value){

      if(value.length>=maxLegnth!){
        if(widgetFunction==null){
          print("noFunction");
        }else{
          // widgetFunction();
        }
      }
    },


    onEditingComplete: (){
      if(widgetFunction==null){
        print("noFunction");
      }else{
        //widgetFunction();
      }

    },

  );
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
  int start = 0;
  int check = 0;
  int checks = 0;
  int sign_up = 0;
  int auth_check = 0;
  String id = '';
  String email = '';
  String password = '';
  String password_check = '';
  String nickname = '';
  String _verificationId = '';
  String code = '';
  String title = '';
  String subtitle = '';
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController id_over = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController phoneNumberController1 = TextEditingController();
  TextEditingController phoneNumberController2 = TextEditingController();

  FocusNode phoneNumberFocusNode1=FocusNode();
  FocusNode phoneNumberFocusNode2=FocusNode();
  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text(title),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  subtitle,
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                  if(sign_up == 1)
                  {
                    Get.to(Login());
                  }
                  else if(sign_up == 0)
                  {
                    //nothing
                  }
                },
              ),
            ],
          );
        });
  }
  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async{
    try{
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);
      if(authCredential?.user != null){
        auth_check = 1;
        title = '인증 완료!';
        subtitle = '인증이 완료되었습니다!';
        FlutterDialog();
        setState(() {
          print("인증 완료");
        });
      }

    }on FirebaseAuthException catch (e){
      setState(() {
        print('인증 실패');
      });
      auth_check = 0;
      title = '인증 실패!';
      subtitle = '인증 번호 받기를 다시 해주세요.';
      FlutterDialog();
    }

  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
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
                            auth_check = 0;
                            sign_up = 0;
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
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '아이디',
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: id_over,
                                      onTapOutside: (event) =>
                                          FocusManager.instance.primaryFocus?.unfocus(),
                                    ),
                                    Container(height: 5),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 115,
                                child: ElevatedButton(
                                  onPressed: () {
                                    for(int i = 0; i < long; i++) {
                                      if (ids[i] == id_over.text) {
                                        id_check = 1;
                                        break;
                                      }
                                    }
                                    if(id_check == 1)
                                    {
                                      sign_up = 0;
                                      title = '아이디 중복!';
                                      subtitle = '아이디가 중복됩니다!';
                                      FlutterDialog();
                                    }
                                    else
                                    {
                                      title = '알림';
                                      subtitle = '사용 가능한 아이디입니다!';
                                      FlutterDialog();
                                    }
                                  },
                                  child: Text("중복 확인"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Color(0xffBCCF9B))),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '비밀번호',
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                obscureText: true,
                                onTapOutside: (event) =>
                                    FocusManager.instance.primaryFocus?.unfocus(),
                                onSaved: (val) {
                                  setState(() {
                                    this.password = val!;
                                  });
                                },
                                validator: (val) {
                                  if (val!.length < 1) {
                                    return '비밀번호는 필수입니다';
                                  }
                                  return null;
                                },
                              ),
                              Container(height: 5),
                            ],
                          ),


                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '비밀번호 확인',
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                obscureText: true,
                                onTapOutside: (event) =>
                                    FocusManager.instance.primaryFocus?.unfocus(),
                                onSaved: (val) {
                                  setState(() {
                                    this.password_check = val!;
                                  });
                                },
                                validator: (val) {
                                  if (val!.length < 1) {
                                    return '비밀번호 확인은 필수입니다';
                                  }
                                  return null;
                                },
                              ),
                              Container(height: 5),
                            ],
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
                          SizedBox(height: 1),
                          Row(
                            children: [
                              Text(
                                '휴대폰',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: numberInsert(
                                    editAble: false,
                                    hintText: "010",
                                    textInputAction: TextInputAction.next,
                                  )),
                              SizedBox(width: 5,),
                              Expanded(
                                flex: 1,
                                child: numberInsert(
                                  hintText: "0000",
                                  focusNode: phoneNumberFocusNode1,
                                  controller: phoneNumberController1,
                                  textInputAction: TextInputAction.next,
                                  maxLegnth: 4,
                                  widgetFunction: (){
                                    FocusScope.of(context).requestFocus(phoneNumberFocusNode2);
                                  },

                                ),
                              ),

                              SizedBox(width: 5,),
                              Expanded(
                                flex: 1,
                                child: numberInsert(
                                  hintText: "0000",
                                  focusNode: phoneNumberFocusNode2,
                                  controller: phoneNumberController2,

                                  maxLegnth: 4,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),

                              SizedBox(width: 5,),
                              Container(
                                width: 115,
                                child: ElevatedButton (
                                  onPressed: () async{
                                    sign_up = 0;
                                    auth_check = 0;
                                    if(phoneNumberController1.text.length != 4 || phoneNumberController2.text.length != 4)
                                    {
                                      title = '경고!';
                                      subtitle = '전화번호를 정확하게 입력해주세요!';
                                      FlutterDialog();
                                    }
                                    await _auth.verifyPhoneNumber(
                                        timeout: const Duration(seconds: 120),
                                        phoneNumber: "+8210"+phoneNumberController1.text+phoneNumberController2.text,
                                        verificationCompleted: (PhoneAuthCredential credential) async{
                                          print('인증 문자 수신');
                                        },
                                        verificationFailed: (FirebaseAuthException e)async{
                                          print('인증 문자 전송 실패');
                                        },
                                        codeSent: (String verifiationId, resendingToken)async{
                                          print('인증 문자 전송');
                                          title = '인증번호를 전송했습니다!';
                                          subtitle = '60초 이내 입력해주세요!';
                                          FlutterDialog();
                                          _verificationId = verifiationId;
                                          print(_verificationId);
                                        },
                                        codeAutoRetrievalTimeout: (String verificationId){}
                                    );
                                  },

                                  child: Text("인증번호 받기"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Color(0xffBCCF9B))),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height : 5,),
                          Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: otp,
                                  decoration: InputDecoration(
                                      labelText: '인증번호',
                                      hintText: '숫자 6개 입력'),
                                ),
                              ),
                              Container(
                                width: 115,
                                child: ElevatedButton(
                                  onPressed: () {
                                    PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: _verificationId,
                                        smsCode: otp.text);
                                    signInWithPhoneAuthCredential(credential);
                                  },
                                  child: Text("확인"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Color(0xffBCCF9B))),
                                ),
                              ),
                            ],
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
                                        if(nicknames[i] == this.nickname)
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


                                      if(auth_check == 1 && id_check == 0 && email_check == 0 && nick_check == 0)
                                      {
                                        title = '축하합니다!';
                                        subtitle = '가입이 완료되었습니다!';
                                        sign_up = 1;
                                        firestore.collection('member').add({'email' : this.email, 'id' : this.id, 'nickname' : this.nickname, 'password' : this.password});
                                        FlutterDialog();
                                      }

                                      else if(id_check == 0)
                                      {
                                        sign_up = 0;
                                        title = '알림';
                                        subtitle = '아이디 중복확인을 해주세요!';
                                        FlutterDialog();
                                      }

                                      else if(this.password != this.password_check)
                                      {
                                        sign_up = 0;
                                        title = '비밀번호 불일치!';
                                        subtitle = '비밀번호를 다시 확인해주세요!';
                                        FlutterDialog();
                                      }
                                      else if(nick_check == 1)
                                      {
                                        sign_up = 0;
                                        title = '닉네임 중복!';
                                        subtitle = '닉네임이 중복됩니다!';
                                        FlutterDialog();
                                      }
                                      else if(email_check == 1)
                                      {
                                        sign_up = 0;
                                        title = '이메일 중복!';
                                        subtitle = '이메일이 중복됩니다!';
                                        FlutterDialog();
                                      }

                                      else if(auth_check == 0)
                                      {
                                        sign_up = 0;
                                        title = '경고!';
                                        subtitle = '휴대폰 인증을 진행해주세요!';
                                        FlutterDialog();
                                      }
                                    }
                                  },
                                  child: Text("가입", style: TextStyle(
                                      fontSize: 25),),
                                  style: TextButton.styleFrom(
                                      minimumSize: Size(300, 50),
                                      backgroundColor: Color(0xffBCCF9B))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          );
        });
  }
}
