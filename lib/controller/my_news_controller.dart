import 'package:flutter/material.dart';
import 'package:frontliners/model/newsDM.dart';
import 'package:frontliners/networking/api_client.dart';
import 'package:frontliners/networking/url.dart';
import 'package:get/get.dart';

class MyNewsController extends GetxController {
  var isLoading = false.obs;
  NewsDm newsDm;

  int pageSize = 0;
  int totalPage = 0;

  ScrollController scrollController = new ScrollController();
  int _page = 1;
  List<Article> get allNews => newsDm.articles;
  double get totalRecords => newsDm.totalResults.toDouble();

  @override
  void onInit() {
    super.onInit();

    newsDm = NewsDm();
    getNews(_page);

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        getNews(++_page);
        update();
      }
    });
  }

  getNews(pageNumber) async {
    isLoading.value = true;
    update();
    if ((totalPage == 0) || pageNumber <= totalPage) {
      String url = "${URL.newsUrlWithKey}&page=$pageNumber";

      var response = await ApiClient.getFormData(url: url);
      isLoading.value = false;
      NewsDm newsData = newsDmFromJson(response);

      if (newsDm.articles == null) {
        newsDm = newsData;
        update();
      } else {
        newsDm.articles.addAll(newsData.articles);
        newsDm = newsDm;
        update();
      }

      update();
    }
  }
}
