import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MaterialApp(home : Splash(),));

}
class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold( //backgroundColor: Colors.purple ,
      body: Container(
        decoration: const BoxDecoration(
          ///to set background image for body
          // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: NetworkImage(
            //         "https://images.unsplash.com/photo-1604560109558-fdd438a533c4?auto=format&fit=crop&q=80&w=1693&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) 
             ///to set background gradient for body
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black38 , Colors.redAccent , Colors.blueAccent ])
                ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.dark_mode,size : 100, color: Colors.white,),
              Image(image: AssetImage("assets/icons/bat.png"),height: 100,width: 100,),
              //Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPN54gqYu08y8e5-iq2xm8k6GtevxI2_xO7w&usqp=CAU"),),
              Text("NIPHAH",
                // style: TextStyle(fontSize: 30 , color: Colors.white,fontWeight : fontWeight.bold),
                style: GoogleFonts.zeyada(fontSize: 30 , color: Colors.white, fontWeight: FontWeight.bold),

                ),
            ],
          ),),
      ),);
  }

}