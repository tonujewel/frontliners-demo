import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0),
        body: Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.asset(
                "assets/images/loader.gif",
                scale: 6,
                fit: BoxFit.fill,
                height: 80,
                width: 80,
              )),
        ));
  }
}

//
//
// Container(
// margin: EdgeInsets.all(10),
// child: Card(
// elevation: 4,
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
// child: InkWell(
// onTap: () => print("ciao"),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// //  "${myNewsController.newsDm.value.articles[index].title}",
// Row(
// children: [
// Icon(Icons.music_note),
// Flexible(
// child: new Container(
// padding: new EdgeInsets.only(right: 13.0),
// child: new Text(
// "${myNewsController.newsDm.value.articles[index].title}",
// overflow: TextOverflow.ellipsis,
// style: new TextStyle(
// fontSize: 13.0,
// ),
// ),
// ),
// ),
// ],
// ),
// Padding(
// padding: EdgeInsets.all(10),
// child: ClipRRect(
// child: Image.asset(
// 'assets/images/header_bg.jpg',
// fit: BoxFit.fill,
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// );


