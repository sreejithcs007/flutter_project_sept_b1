import 'package:flutter/material.dart';

import '../carousel___slider.dart';
import '../grid_View/gridview2.dart';
import '../grid_View/gridview_1.dart';
void main(){
  runApp(MaterialApp(home: BottomNAv2(),));
}
class BottomNAv2 extends StatefulWidget{

  @override
  State<BottomNAv2> createState() => _BottomNAv2State();
}

class _BottomNAv2State extends State<BottomNAv2> {
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,

        //  unselectedItemColor: Colors.white,

          onTap: (tapindex){
        setState(() {
          index = tapindex;
        });

      },
          type: BottomNavigationBarType.shifting,
         // backgroundColor: Colors.yellow,
         currentIndex: index,
          items:
      [BottomNavigationBarItem(
          icon: Icon(Icons.home,
          color: Colors.black,),
          label: "home",
          backgroundColor: Colors.orange

      ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,color: Colors.black,),
          label: "profile",

          backgroundColor: Colors.red,

        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.search,color: Colors.black,),
            label: "search",

            backgroundColor: Colors.blueAccent

        )
      ]
      ),
      body: scrn[index],

    );
  }
}