import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Orient1(),));
}

class Orient1 extends StatelessWidget{

  var orientation,height,width;
  @override

  Widget build(BuildContext context) {
    //getting the  orientation of app
    orientation = MediaQuery.of(context).orientation;
    //size of window
    //size = MediaQuery.of(context.size;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Media Query"),
      ),
      body: orientation == Orientation.portrait ? Container(height: height/2,width: width/2,color: Colors.lightBlueAccent,)
          : Container(height: height/4,width: width/4,color: Colors.pinkAccent,)


    );
  }


}