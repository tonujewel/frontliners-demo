import 'package:frontliners/view/my_news/my_news.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  
  
  void goToMyNewsPage(){

    Get.to(() => MyNews());
}
}