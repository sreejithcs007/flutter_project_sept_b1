import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/passing_data_btwn_screens/dummy_data.dart';

import 'details.dart';
void main(){
  runApp(MaterialApp(
    home: ProductList(),
    debugShowCheckedModeBanner: false,
      routes: {"details" : (context) => Details(),}));
}

class ProductList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("PRODUCT LIST"),
      ),
      body: ListView(
        ///e - single map
        children: products.map((e) => ListTile(leading:Text( e["name"] ,),
          trailing:
          Image.asset(e["image"]),
          onTap: () =>gotodetails(context,e["id"]),
          //onTap () => Navigator.pushNamed(context,"details",arguments: e["id"]),)).toList()
          
        )).toList(),
      ),

    );
  }

  void gotodetails(BuildContext context, id) {

    Navigator.pushNamed(context, "details",arguments: id);



  }


}