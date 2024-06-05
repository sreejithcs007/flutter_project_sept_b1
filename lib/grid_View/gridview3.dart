import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Gridview3(),));
}
class Gridview3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      GridView.count(crossAxisCount: 4,
        children: List.generate(20, (index) => Container(
          child: 
          Column(
            children: [
              Expanded(child: Image.asset("assets/images/grapes.png",fit: BoxFit.fill,)),
              Expanded(child: Text("NAture",style: TextStyle(color: Colors.black),))
            ],
          ),
        )),
      ),
    );
  }
  
}