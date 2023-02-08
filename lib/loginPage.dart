import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onthewheelpractice/firebase_options.dart';
import 'package:onthewheelpractice/main.dart';
import 'package:onthewheelpractice/signup_page.dart';
import 'package:onthewheelpractice/size.dart';
import 'Home.dart';
import 'login/kakao_login.dart';
import 'login/main_view_modal.dart';
import 'map/naverMap.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final viewModel = MainViewModel(KakaoLogin());

  CollectionReference database = FirebaseFirestore.instance.collection('user');
  late QuerySnapshot querySnapshot;

  final userReference = FirebaseFirestore.instance.collection('user');
  final TextEditingController id_filter = TextEditingController();
  final TextEditingController pw_filter = TextEditingController();
  FocusNode focusNode = FocusNode();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // saveUserInfoFirestore();
    DocumentSnapshot documentSnapshot =
        await userReference.doc(googleUser.email).get();
    print('google - login');
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  userstart() {
    FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((doc) async {
      print('회원 관리');
      if (!doc.exists) {
        userReference.doc(FirebaseAuth.instance.currentUser!.uid).set({
          'profileName': FirebaseAuth.instance.currentUser!.displayName!,
          'url': FirebaseAuth.instance.currentUser!.photoURL!,
          'email': FirebaseAuth.instance.currentUser!.email,
          'status_message': 'I promise to take the test honestly before GOD.',
          'uid': FirebaseAuth.instance.currentUser!.uid
        }).whenComplete(() {
          print('완료');
          Get.to(NaverMapTest());
        });
      } else {
        print('이미 있는 아이디');
        Get.to(NaverMapTest());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int login_check = 0;
    List<String> id = [];
    List<String> password = [];
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
                  new Text("로그인 실패!"),
                ],
              ),
              //
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "아이디 혹은 비밀번호가 틀렸습니다!",
                  ),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: new Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('member').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          int long = snapshot.data!.docs.length;
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            var member = snapshot.data!.docs[i];
            id.add(member.get('id'));
            password.add(member.get('password'));
          }
          return SafeArea(
              child: Scaffold(
            body:
              Container(
                height: getScreenHeight(context),
                color: Color(0xffbccf9b),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.off(Home());
                        },
                        icon: Icon(Icons.arrow_back)),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "   On The Wheel",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 220,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Column(
                        children: [
                          TextField(
                              focusNode: focusNode,
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                              controller: id_filter,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                  hintText: '아이디',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white70),
                              textInputAction: TextInputAction.go),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 5),
                      child: Column(
                        children: [
                          TextField(
                            controller: pw_filter,
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 35,
                                  color: Colors.black,
                                ),
                                hintText: '비밀번호',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: Colors.white70),
                            obscureText: true,
                            onSubmitted: (value) {
                              setState(() {
                                for (int i = 0; i < long; i++) {
                                  if (id[i] == id_filter.text &&
                                      password[i] == pw_filter.text) {
                                    login_check = 1;
                                    Get.to(NaverMapTest());
                                  }
                                }
                                if (login_check == 0) {
                                  FlutterDialog();
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 43,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "아이디 찾기",
                              style: TextStyle(color: Color(1761607680)),
                            )),
                        Text(
                          "|",
                          style: TextStyle(color: Color(1761607680)),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "비밀번호 찾기",
                              style: TextStyle(color: Color(1761607680)),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              for (int i = 0; i < long; i++) {
                                if (id[i] == id_filter.text &&
                                    password[i] == pw_filter.text) {
                                  login_check = 1;
                                  Get.to(NaverMapTest());
                                }
                              }
                              if (login_check == 0) {
                                FlutterDialog();
                              }
                            },
                            child: Text(
                              "로그인",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                        ),
                        ElevatedButton.icon(
                            onPressed: () async {
                              await viewModel.login();
                            },
                            icon: Icon(
                              Icons.chat_bubble,
                              color: Color(0xff9D6F45),
                            ),
                            label: Text(
                              "카카오톡",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff9D6F45),
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xffFFF38A)))),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton.icon(
                            onPressed: () async {
                              //Future.delayed는 duration을 통해서 value가 생성될 시간을 제어할 수 있다
                              //
                              // 실제 프로젝트에서 delayed는 주로 progress bar로 값을 받아올 때 10-15초 정도 delayed 후에도 value가 생성되지 않으면 '다시 시도'를 할 수 있게 하는 버튼을 띄울 때나 UI를 control하고 싶을 때 주로 사용하는 것 같고 비동기 처리는 거의 대부분 async-await를 사용한다
                              signInWithGoogle();
                              await Future.delayed(Duration(seconds: 10));
                              userstart();
                            },
                            icon: Icon(
                              Icons.language,
                              color: Colors.black,
                            ),
                            label: Text(
                              "Google",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          "아직 회원이 아니세요?     |   ",
                          style: TextStyle(color: Color(0x69000000)),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(() => SignUp());
                            },
                            child: Text(
                              "회원가입",
                              style: TextStyle(color: Colors.red, fontSize: 17),
                            ))
                      ],
                    )
                  ],
                ),
              ),

          ));
        });
  }
}
