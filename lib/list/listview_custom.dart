import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: ListView4(),));
}

class ListView4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Listview Custom"),
     ),
     body: ListView.custom(
         //childrenDelegate: SliverChildListDelegate(
        // [
       // Card(child:Center(child: Text("hello"),),),
       // Card(child:Center(child: Text("hello"),),),
       // Card(child:Center(child: Text("hello"),),),
       // Card(child:Center(child: Text("hello"),),),
       //  ]
       //List.generate(10, (index) => const Card(child: Center(child: Text("hello"),),)),
         childrenDelegate: SliverChildBuilderDelegate(
               childCount: 10,
               (context, index) => Card(
           child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Image.asset("assets/images/grapes.png"),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("grapes"),
                   Text("2 kg"),
                   Text("price : \$ 100/kg")
                 ],
               ),
               Expanded(
                 child: MaterialButton(onPressed: (){},
                   shape: StadiumBorder(),
                   color: Colors.brown,
                   minWidth: 120,
                   height: 40,
                 child: Text("Add to cart",
                 style: TextStyle(color: Colors.white),),),
               )
               
             ],
         )
         ),

     )
   ),
   );
  }


}