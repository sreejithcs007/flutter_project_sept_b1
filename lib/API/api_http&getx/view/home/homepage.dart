import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/API/api_http&getx/view/home/widgets/product_tile.dart';
import 'package:get/get.dart';

import '../../controller/product_controller.dart';

void main() {
  runApp(GetMaterialApp(
    home: ProductHome(),
  ));
}

class ProductHome extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SizedBox(
        child: Obx(() {   // Obx is to make the widget observable
          if (productController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
                itemCount: productController.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ProductTile(
                      productController.productList[index]);
                });
          }
        }),
      ),
    );
  }
}
