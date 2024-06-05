import 'package:flutter/material.dart';

class MobileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Mobile Screen"),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.yellow,
                ),
              ),
            ),
            //list of videos
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  color: Colors.pinkAccent,
                  height: 120,
                ),
              );
            },
              itemCount: 8,))
          ],
        ),
      ),
    );
  }


}