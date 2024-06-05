import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: BottomNAv(),));
}
class BottomNAv extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("BOTTOM NAVIGATION BAR"),),
     bottomNavigationBar: BottomNavigationBar(items:
     [BottomNavigationBarItem(
         icon: Icon(Icons.home),
         label: "home",
       backgroundColor: Colors.orange

     ),
       BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: "profile",
           backgroundColor: Colors.red,

       ),

       BottomNavigationBarItem(
           icon: Icon(Icons.search),
           label: "search",
           backgroundColor: Colors.blueAccent

       )
     ]),
   );
  }

}