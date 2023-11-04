import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/login_page.dart';

import 'package:lottie/lottie.dart';

void main(){
  runApp(MaterialApp(home : Splash2(),));

}


class Splash2 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _Splash2tate(); // create a mutable state for this widget


}

class _Splash2tate  extends State<Splash2>{
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LoginPage() ));

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: //Lottie.asset("assets/animation/anime.json"),
        Lottie.network("https://lottie.host/759395d4-0e7f-4f3a-bd9a-9cc5c8aa4459/8gmtwRTGaD.json")
      ),
    );
  }

}

