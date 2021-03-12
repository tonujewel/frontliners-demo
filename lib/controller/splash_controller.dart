import 'dart:async';
import 'package:frontliners/main.dart';
import 'package:frontliners/view/home_screen/home_screen.dart';
import 'package:frontliners/view/login/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    Timer(Duration(seconds: 2), () {
      if (prefs.getBool("isLogin") == null) {
        Get.off(LoginScreen());
      } else {
        Get.off(HomeScreen());
      }
    });
    super.onInit();
  }
}
