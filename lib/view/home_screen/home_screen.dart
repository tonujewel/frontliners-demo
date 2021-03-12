import 'package:flutter/material.dart';
import 'package:frontliners/controller/home_controller.dart';
import 'package:frontliners/utils/style.dart';
import 'package:frontliners/widget/side_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true, title: Text("Home")),
      drawer: SideDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.notifications),
        onPressed: () {
          Get.snackbar("Floating click", "Clicked");
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: Get.height * .11, backgroundImage: AssetImage("assets/images/header_bg.jpg")),
            SizedBox(height: Get.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardItem(name: "Feed Updates", iconData: Icons.history),
                SizedBox(width: Get.height * 0.02),
                cardItem(name: "Search Job", iconData: Icons.search),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardItem(name: "My Safety", iconData: Icons.security),
                SizedBox(width: Get.height * 0.02),
                cardItem(name: "My News", iconData: Icons.wysiwyg,
                onClick: (){
                  homeController.goToMyNewsPage();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  cardItem({String name, IconData iconData, Function onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        elevation: 4,
        child: Container(
          height: Get.width * .3,
          width: Get.width * .3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 50,
                color: Style.primaryColor,
              ),
              SizedBox(height: Get.height * 0.01),
              Text("$name"),
            ],
          ),
        ),
      ),
    );
  }
}
