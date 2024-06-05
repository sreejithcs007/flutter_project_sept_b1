import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/API/api_dio/controller/post_controller.dart';
import 'package:flutter_project_sept_b1/API/api_dio/utils/colors.dart';
import 'package:flutter_project_sept_b1/API/api_dio/views/dio_details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
void main() {
  runApp(GetMaterialApp(
    home: HomeDio(),
  ));
}

class HomeDio extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.bgcolor,
      floatingActionButton: Obx(() =>
      controller.isInternetConncted.value ? buildFAB() : Container()),
      body: Obx(() =>
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: controller.isInternetConncted.value
                ? (controller.isloading.value ? loadAnimation() : getData())
                : noInternet(context),
          )),
    );
  }

  FloatingActionButton buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        controller.isListScrollDown.value
            ? controller.scrollUp()
            : controller.scrollDown();
      },
      backgroundColor: Mycolors.flotcolor,
      child: FaIcon(
        controller.isListScrollDown.value
            ? FontAwesomeIcons.arrowUp
            : FontAwesomeIcons.arrowDown,
      ),
    );
  }

  Center loadAnimation() {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Lottie.asset("assets/animations/loading.json"),
      ),
    );
  }

  ScrollablePositionedList getData() {
   // return RefreshIndicator(
      // onRefresh: () {
      //  return controller.getPost();
      // },
      // child:
      return ScrollablePositionedList.builder(
          itemScrollController: controller.itemController,
          physics: BouncingScrollPhysics(),
          itemCount: controller.postlist.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.to(DetailsDio()),
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(controller.postlist[index].id.toString()),
                    ),
                  ),
                  title: Text(
                    controller.postlist[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(controller.postlist[index].body),
                ),
              ),
            );
          }
    );
  }

  Center noInternet(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Lottie.asset("assets/animations/nointernet.json"),
          ),
          MaterialButton(
            onPressed: () => ontapMaterialButton(context),
            child: const Text("Try Again"),
          )
        ],
      ),
    );
  }
  void ontapMaterialButton(BuildContext context) async {
    if (await InternetConnectionChecker().hasConnection == true) {
      controller.getPost();
    } else {
      showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: 'No Internet Connection!!! Please Try Again',));
    }
  }
}