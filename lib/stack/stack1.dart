import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Stack1(),));
}

class Stack1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("STACK"),
      ),

      body: Stack(
        children: [
          Container(height:MediaQuery.of(context).size.height,width:300,color: Colors.red,),
          Container(
            height:250,width:250,
            //color: Colors.blue,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),
            image: DecorationImage(image: AssetImage("assets/images/tree.jpg"),fit: BoxFit.fill
            )
          ),  
          ),
          Positioned(
            left: 30,
            top: 20,
            child: Text("NAMe",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 38,color: Colors.white),
            ),
          ),

          Positioned(
            //left: 100,
             right: 60,
              //top: 100,
              bottom: 90,
              child: //Container(height:150,width:150,color: Colors.pinkAccent,)
              Text("place",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),
              ),
             ),

        ],
      ),
    );
  }


}