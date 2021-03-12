
import 'package:flutter/material.dart';
import 'package:frontliners/controller/splash_controller.dart';
import 'package:frontliners/widget/background.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Frontliners', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          ],
        ),
      ),
    );
  }
}