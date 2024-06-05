import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
void main(){

  runApp(MaterialApp(home: Clippers1(),));
}

class Clippers1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CLIPPERS"),
       // backgroundColor: Colors.blue,
      ),
      body:
      ListView(
        children: [
          ClipRect(
          child: Align(
              widthFactor: .4,
              heightFactor: .6,
              child: Image(image: AssetImage("assets/images/tree.jpg"))),
        ),

        ClipRRect(

         borderRadius: BorderRadius.circular(500),
          child: Image(image: AssetImage("assets/images/tree.jpg"))
        ),

          ClipOval(
            child: Image(image: AssetImage("assets/images/tree.jpg")),

          ),

          ClipPath(
            clipper: TriangleClipper(),
            child: Image(image: AssetImage("assets/images/tree.jpg")),



          ),

          ClipPath(
            clipper: MovieTicketBothSidesClipper(),
            child: Container(

              color: Colors.red,
              height: 200,

            ),
          ),
          ClipPath(
            clipper: MultiplePointedEdgeClipper(),
            child: Container(
              color: Colors.lightBlue,
              height: 200,
            ),
          ),

          ClipPath(
            clipper: WaveClipperTwo(reverse: true),
            child: Image(image: NetworkImage("https://i0.wp.com/sitn.hms.harvard.edu/wp-content/uploads/2019/09/image1.jpg?fit=1432%2C573&ssl=1")),
          )




        ],
      ),

    );
  }


}