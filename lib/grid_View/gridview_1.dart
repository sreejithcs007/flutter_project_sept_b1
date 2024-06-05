import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Gridview1(),));
}

class Gridview1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(backgroundColor: Colors.green,

    body:
    // GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
    // children:
    // List.generate(20, (index) => Card(
    //   child: Image.asset("assets/images/ref.jpeg")
    // )
    // )
      
    // ),
    // GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
    // mainAxisSpacing: 50,crossAxisSpacing: 20),
    // children: List.generate(20, (index) => Card(
    //   //color: Colors.black,
    //   child: Image.asset("assets/images/ref.jpeg"),
    // )),)
    GridView(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
        mainAxisSpacing: 50,crossAxisSpacing: 20,mainAxisExtent: 200),
      children: List.generate(20, (index) => Container(
        decoration: BoxDecoration(color: Colors.deepOrangeAccent),
        //color: Colors.black,
        child: Image.asset("assets/images/ref.jpeg"),
      )),)
  );
  }

}