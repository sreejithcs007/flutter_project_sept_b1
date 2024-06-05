import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/grid_View/mywidget.dart';
void main() {
  runApp(MaterialApp(home: Gridview5(),));
}
class Gridview5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      GridView.custom(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          childrenDelegate: SliverChildBuilderDelegate(childCount: 4,(context, index) =>
              Mywidget(Colors.blue, label: Text("hi"), onpressed: (){},image: (Image(image: AssetImage("assets/images/ref.jpeg"))),)

              // Container(
              //   child: Image.asset("assets/images/grapes.png")),



              )
              )
    ) ;

  }
  
  
}