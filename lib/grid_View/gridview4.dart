import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Gridview4(),));
}
class Gridview4 extends StatelessWidget{

  var ic = [Icons.ice_skating,
    Icons.ice_skating,
    Icons.ice_skating,
    Icons.ice_skating,
    Icons.ice_skating,
    Icons.icecream,
    Icons.ice_skating,
    Icons.ice_skating,
    Icons.ice_skating,
    Icons.ice_skating,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GridView.extent(maxCrossAxisExtent: 120,
      children: List.generate(10, (index) => Container(
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/images/grapes.png")),
            Expanded(child: Icon(ic[index])),
          ],
        ),
      ))
        ,),

    );
  }


}