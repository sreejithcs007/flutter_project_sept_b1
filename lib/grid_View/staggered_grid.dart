import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: Staggered_Grid(),));
}
class Staggered_Grid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListView.builder(
     itemCount: 5,
     itemBuilder: (context,index){

       return StaggeredGrid.count(crossAxisCount: 4,


       children: [

         StaggeredGridTile.count(crossAxisCellCount: 2,
      mainAxisCellCount: index == 0 ? index+2 : index+1,
      child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
            decoration: BoxDecoration(
              color: Colors.pink,
              // image: DecorationImage(image: AssetImage("assets/images/grapes.png"))


            )
        ),
      )
         ),


       ],
       );


     },
     // children: [
     //   StaggeredGrid.count(crossAxisCount: 4,
     //       children: [StaggeredGridTile.count(crossAxisCellCount: 2,
     //           mainAxisCellCount: 3.5,
     //           child:
     //           Padding(
     //             padding: const EdgeInsets.all(8.0),
     //             child: Container(
     //                 decoration: BoxDecoration(
     //                   color: Colors.pink,
     //                   // image: DecorationImage(image: AssetImage("assets/images/grapes.png"))
     //
     //
     //                 )
     //             ),
     //           )
     //       ),

             // StaggeredGridTile.count(crossAxisCellCount: 2,
             //     mainAxisCellCount: 4,
             //     child:
             //     Container(
             //         decoration: BoxDecoration(
             //           color: Colors.green,
             //             image: DecorationImage(image: AssetImage("assets/icons/bat.png"))
             //
             //
             //         )
             //     )
             // ),
             //
             // StaggeredGridTile.count(crossAxisCellCount: 3,
             //     mainAxisCellCount: 3,
             //     child:
             //     Container(
             //
             //         decoration: BoxDecoration(
             //           color: Colors.black,
             //             image: DecorationImage(image: AssetImage("assets/images/ref.jpeg"))
             //
             //
             //         )
             //     )
             // ),


     //       ]
     //   ),
     // ],
     )
   );
  }

}