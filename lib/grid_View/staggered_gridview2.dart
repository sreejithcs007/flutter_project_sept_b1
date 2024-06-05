import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
void main(){
  runApp(MaterialApp(home: Staggered_Gridview2(),));
}
class Staggered_Gridview2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:
     StaggeredGrid.extent(maxCrossAxisExtent: 520,
     children: [
       StaggeredGridTile.extent(crossAxisCellCount: 1, mainAxisExtent: 120,
           child:Container(
             decoration: BoxDecoration(
             color: Colors.orange,
              image: DecorationImage(image: AssetImage("assets/images/ref.jpeg"))
             ),
           ) ),

       StaggeredGridTile.extent(crossAxisCellCount: 1, mainAxisExtent: 120,
           child:Container(
             decoration: BoxDecoration(
               color: Colors.green,
                 image: DecorationImage(image: AssetImage("assets/icons/bat.png"))
             ),
           ) ),

       StaggeredGridTile.extent(crossAxisCellCount: 3, mainAxisExtent: 120,
           child:Container(
             decoration: BoxDecoration(
               color: Colors.yellow,
                 image: DecorationImage(image: AssetImage("assets/images/grapes.png"))
             ),
           ) ),


     ],),
   );
  }


}