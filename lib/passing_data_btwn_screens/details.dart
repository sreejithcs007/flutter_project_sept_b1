import 'package:flutter/material.dart';

import 'dummy_data.dart';

class Details extends StatelessWidget{
                                                            ///Tapid - id that has been taaped on product_list page
  @override
  Widget build(BuildContext context) {
    final Tapid = ModalRoute.of(context)?.settings.arguments;   ///fetching the id of tapped map
    final product = products.firstWhere((e) => e["id"] == Tapid); ///comparing tapid and the element id
    return Scaffold(
      body: Center(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(product["image"]),
            ),
            Text(product["name"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            Text("RATE : ${product["price"]}",style: TextStyle(fontWeight: FontWeight.bold),),
            Text(product["description"])
          ],
        ),
      ),
    );
  }

}