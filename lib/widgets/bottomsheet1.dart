import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: BottomSheet1(),));
}

class BottomSheet1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: GestureDetector(onLongPress: (){
         showsheet(context);
       },
           child: Image(image: AssetImage("assets/images/tree.jpg"))
       ),
     ),
   );
  }


}

void showsheet(BuildContext context) {
  showModalBottomSheet(context: context, builder: (context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Row(
        //     children: [
        //       Icon(Icons.share),
        //       Text("\nShare")
        //     ],
        //   ),
        // ),
        // SizedBox(height: 23,width: 23,),
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Row(
        //     children: [
        //       Icon(Icons.copy),
        //       Text("\nCopy")
        //     ],
        //   ),
        // )
        
        ListTile(
          leading: Icon(Icons.share),
         // trailing: Text("SHARE"),
          subtitle: Text("SHARE"),

        ),
        ListTile(
          leading: Icon(Icons.copy),
          subtitle: Text("COPY"),
         // trailing: Text("COPY"),
        )
      ],
    );
  });
}