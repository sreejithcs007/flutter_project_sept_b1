import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../carousel___slider.dart';
import '../grid_View/gridview2.dart';
import '../grid_View/gridview_1.dart';
void main(){
  runApp(MaterialApp(home: Convexapp(),));
}
class Convexapp extends StatefulWidget{

  @override
  State<Convexapp> createState() => _ConvexappState();
}

class _ConvexappState extends State<Convexapp> {
  int index = 0;
  var scrn =[
    Gridview2(),
    Carousel(),
    Gridview1()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BOTTOM NAVIGATION BAR"),),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [TabItem(icon: Icon(Icons.home)),
      TabItem(icon: Icon(Icons.person)),
      TabItem(icon: Icon(Icons.search)),

      ],onTap: (tabindex){
        setState(() {
          index = tabindex;
        });
      },



      ),
      body: scrn[index],

    );
  }

}