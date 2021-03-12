import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(image: AssetImage("assets/images/header_bg.jpg"), fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 35.0, backgroundImage: AssetImage("assets/images/placeholder.jpg")),
                SizedBox(height: 10),
                Text("Md. Jewel Rana", style: TextStyle(fontSize: 16, color: Colors.white)),
                Text(
                  "tonujewel@gmail.com",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
              leading: Icon(Icons.music_note),
              title: Text("Music"),
              onTap: () {
                Get.back();
                Get.snackbar("Music", "clicked", snackPosition: SnackPosition.BOTTOM);
              }),
          ListTile(
              leading: Icon(Icons.movie),
              title: Text("Movie "),
              onTap: () {
                Get.back();
                Get.snackbar("Movie", "clicked", snackPosition: SnackPosition.BOTTOM);
              }),
          ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Shopping"),
              onTap: () {
                Get.back();
                Get.snackbar("Shopping", "clicked", snackPosition: SnackPosition.BOTTOM);
              }),
          ListTile(
              leading: Icon(Icons.apps),
              title: Text("Apps"),
              onTap: () {
                Get.back();
                Get.snackbar("Apps", "clicked", snackPosition: SnackPosition.BOTTOM);
              }),
          ListTile(
              leading: Icon(Icons.dock_sharp),
              title: Text("Docs"),
              onTap: () {
                Get.back();
                Get.snackbar("Docs", "clicked", snackPosition: SnackPosition.BOTTOM);
              }),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Get.back();
                Get.snackbar("Settings", "clicked", snackPosition: SnackPosition.BOTTOM);
              }),
          ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {
                Get.back();
                Get.snackbar("About", "clicked", snackPosition: SnackPosition.BOTTOM);
              }),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
              onTap: () {
                Get.back();
                Get.snackbar("Log out", "clicked", snackPosition: SnackPosition.BOTTOM);
              }),
        ],
      ),
    );
  }
}
