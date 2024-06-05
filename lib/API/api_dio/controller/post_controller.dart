import 'package:flutter/cupertino.dart';
import 'package:flutter_project_sept_b1/API/api_dio/service/dio_service.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../model/post_model.dart';

class PostController extends GetxController {
  RxList postlist = RxList();
  RxBool isloading = true.obs;
  RxBool isInternetConncted = true.obs;
  RxBool isListScrollDown = false.obs;
  var url = "https://jsonplaceholder.typicode.com/posts";
  var itemController = ItemScrollController();

  ///to perform scroll actions in scrollable+positioned_list

  checkIfInternetConnected() async {
    ///for checking internet connection
    isInternetConncted.value = await InternetConnectionChecker().hasConnection;
  }

  ///calling api and get response
  getPost() async {
    ///type void
    checkIfInternetConnected();
    isloading.value = true;
    var response = await DioService().getMethod(url);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        postlist.add(PostModel.fromJson(element));
      });
      isloading.value = false;
    }
  }

  scrollDown() {
    itemController.scrollTo(
        index: postlist.length-5,
        duration: Duration(seconds: 2),
        curve: Curves.linearToEaseOut);
    isListScrollDown.value = true;
  }

  scrollUp() {
    itemController.scrollTo(
        index: 0, duration: Duration(seconds: 2), curve: Curves.bounceInOut);
    isListScrollDown.value = false;
  }

  @override
  void onInit() {
    getPost();
    isInternetConncted();
    super.onInit();
  }
}
