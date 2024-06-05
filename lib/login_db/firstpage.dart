import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/login_db/Login.dart';
import 'package:flutter_project_sept_b1/login_db/signupsql.dart';

void main(){
  runApp(MaterialApp(home: Firstpage(),));
}

class Firstpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text("Hello There!",
           style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black ),
         ),
         Padding(
           padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 30,top: 40),
           child: Text("Automatic identity verification which enables you to verify your identity",
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 15,color: Colors.grey),
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(top: 50.0, left: 30,right: 30,bottom: 30),
           child: Image(image: NetworkImage("https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS2hxgxyQMu1oWu5S7Nenc3RenDkB_C9wW7o_YJ4d12JO_iTT6G")),
         ),
         Padding(
           padding: const EdgeInsets.only(left: 15,bottom: 15, right: 15,top: 100),
           child: MaterialButton(
             height : 50,
             minWidth: 300,
             color: Colors.indigoAccent,
             shape: StadiumBorder(),

             onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
             },
             child: Text("Login",
               style: TextStyle(color: Colors.white),),
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(left: 15.0, right: 15,),
           child: MaterialButton(
             height: 50,
             minWidth: 300,
             color: Colors.red,
             onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => Stateful_Signup()));
             },
             shape: StadiumBorder(),
             child: Text("Sign UP"),
           ),
         )
       ],
     ),
   ),
   );
  }

}
