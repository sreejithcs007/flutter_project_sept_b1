import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../reg_login/stateful_login.dart';
import '../splash/splash_stateful.dart';

void main(){
  runApp(MaterialApp(home: Onboarding1(),));
}

class Onboarding1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(


      pages: [
        PageViewModel(
          title: "page1",
          //titleWidget: Icon(Icons.movie),
          image: Align(
            alignment: Alignment.topCenter,
              child: Image(image: AssetImage("assets/images/tree.jpg"))),
          body: "welcome to first page",

        ),


        PageViewModel(
          title: "page2",
          //titleWidget: Icon(Icons.movie),
          image: Align(
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage("assets/icons/bat.png"))),
          body: "welcome to second page",

        ),

        PageViewModel(
          title: "page3",
          //titleWidget: Icon(Icons.movie),
          image: Align(
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage("assets/images/camera.jpeg"))),
          body: "welcome to third page",

        ),


      ],
      onDone: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => Stateful_Login())),
      onSkip: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => Splash2())),
        showSkipButton: true,
        skip:  Text("Skip"),
        next: Text("Next"),
        done: Text("continue"),
    dotsDecorator: DotsDecorator(
    size: Size(20, 20),
    activeSize: Size(40, 20),
    color: Colors.grey,
    activeColor: Colors.blue,
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(70)
      )
    ) ,
    );
  }

}