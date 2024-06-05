import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Sliver1(),));
}

class Sliver1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
         slivers: [
           SliverAppBar(
             floating: true,
             title: Text("SLIVER EXAMPLE"),
             bottom: AppBar(
               title: Container(height: 40,
                 width: double.infinity,
                 color: Colors.white,
                 child: TextField(
                   decoration: InputDecoration(
                     hintText: "Search",
                     prefixIcon: Icon(Icons.search),
                     suffixIcon: Icon(Icons.camera),

                   ),
                 ) ,
               ),
             ),
           ),
           SliverList(delegate: SliverChildListDelegate(
               List.generate(100, (index) => ListTile(
                 leading: Icon(Icons.person),
                 title: Text("User $index"),

           ))))

         ],
      ),
    );
  }


}