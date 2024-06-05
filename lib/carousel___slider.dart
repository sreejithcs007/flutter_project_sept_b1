import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Carousel(),));
}
class Carousel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:
     CarouselSlider(items: [
       Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           image: DecorationImage(image: AssetImage("assets/images/camer1.jpeg"),fit: BoxFit.fill),
         ),
       ),

       Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           image: DecorationImage(image: AssetImage("assets/images/camera.jpeg"),fit: BoxFit.fill),
         ),
       ),

       Container(
         decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage("assets/images/eye.jpeg"),fit: BoxFit.fill),
         ),
       )
     ],
         options: CarouselOptions(
           //height: double.infinity,
           aspectRatio: 16/9,
           viewportFraction: .8,
           initialPage: 1,
           enableInfiniteScroll: true,
           autoPlay: true,
          // animateToClosest: true,
           autoPlayCurve: Curves.linear,
           autoPlayInterval: Duration(seconds: 2),
           enlargeCenterPage: false,
           scrollDirection: Axis.horizontal
         )
     ),
   );
  }


}