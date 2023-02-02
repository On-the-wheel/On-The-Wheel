import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:onthewheelpractice/login/social_login.dart';

import '../map/naverMap.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          Get.to(()=>NaverMapTest());
          print("카카오 로그인 앱으로 성공");
          return true;
        } catch (e) {
          print("카카오 로그인 앱으로 실패");
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          Get.to(()=>NaverMapTest());
          print("카카오 로그인 웹으로 성공");
          return true;
        } catch (e) {
          print("카카오 로그인 웹으로 실패  $e");
          return false;
        }
      }
    } catch (e) {
      print("카카오 로그인 아예 실패");
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }

}