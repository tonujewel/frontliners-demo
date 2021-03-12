import 'package:flutter/material.dart';
import 'package:frontliners/controller/my_news_controller.dart';
import 'package:frontliners/view/news_webview/news_webview.dart';
import 'package:frontliners/widget/customLoader.dart';
import 'package:frontliners/widget/empty_container.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyNews extends StatefulWidget {
  @override
  _MyNewsState createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyNewsController>(
      init: MyNewsController(),
      builder: (_controller) {
        int num = _controller.allNews?.length ?? 0;
        return ModalProgressHUD(
          inAsyncCall: _controller.isLoading.value,
          progressIndicator: CustomLoader(),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text("Headlines"),
            ),
            body: num != 0
                ? ListView.builder(
                    controller: _controller.scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: num,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        height: Get.height * .4,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                          child: InkWell(
                            onTap: () => Get.to(() => NewsWebView("${_controller.allNews[index].url}")),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.music_note),
                                      Flexible(
                                        child: new Container(
                                          padding: new EdgeInsets.only(right: 13.0),
                                          child: new Text(
                                            "${_controller.allNews[index].title}",
                                            overflow: TextOverflow.ellipsis,
                                            style: new TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Get.height * .01),
                                  ClipRRect(
                                    child: _controller.allNews[index].urlToImage == null
                                        ? Image.asset(
                                            "assets/images/empty.png",
                                            height: Get.height * .31,
                                            width: Get.width * .86,
                                            fit: BoxFit.fill,
                                          )
                                        : Image.network(
                                            "${_controller.allNews[index].urlToImage}",
                                            height: Get.height * .31,
                                            width: Get.width * .86,
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : EmptyContainer(),
          ),
        );
      },
    );
  }
}
