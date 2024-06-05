import 'package:flutter/material.dart';

import 'bigscreen.dart';
import 'mobilescreen.dart';
void main(){
  runApp(MaterialApp(home: HomePage(),debugShowCheckedModeBanner: false,));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery
        .of(context)
        .size
        .width;
    if (devicewidth < 600) {
      return MobileScreen();
    }
    else {
      return BigScreen();
    }
  }
}