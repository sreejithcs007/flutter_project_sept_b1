import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Gridview2(),));
}
class Gridview2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // body: GridView.builder(
      //   itemCount: 20,
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 4,mainAxisSpacing: 4),
      //     itemBuilder: (context,index){
      //
      //   return Container(
      //   color: Colors.pinkAccent,
      //     child: Text("user $index"),
      //   );
      // }),

      body: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 80,mainAxisSpacing: 20,crossAxisSpacing: 20,),

          itemBuilder: (context,index) => Container(
            color: Colors.grey,
            child: Column(
              children: [
                Image.asset("assets/images/ref.jpeg"),
                Text(" hello $index"),
              ],
            ),
          )),
    );
  }


}