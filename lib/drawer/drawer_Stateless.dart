import 'package:flutter/material.dart';
void main(){

  runApp(MaterialApp(home: Drawer1(),debugShowCheckedModeBanner: false,
  theme: ThemeData(primarySwatch: Colors.brown),));
}
class Drawer1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY DRAWER"),
      ),
      drawer: SafeArea(
        top: true,
        child: Drawer(
          backgroundColor: Colors.lightBlue,
          child: ListView(
            children: [UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/tree.jpg"),fit: BoxFit.cover)

              ),
                accountName: Text("ASWIN"), accountEmail: Text("aSWIN@123"),
                currentAccountPicture: CircleAvatar(
               backgroundImage:  AssetImage("assets/images/eye.jpeg")),
            otherAccountsPictures: [ CircleAvatar(
                backgroundImage:  AssetImage("assets/images/camer1.jpeg")),
              CircleAvatar(
                  backgroundImage:  AssetImage("assets/images/ref.jpeg")),],
            currentAccountPictureSize: Size(60, 70),
              arrowColor: Colors.blue,
            ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text("Account"),
              ),

              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),

              ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy"),
              ),

            ],
          ),
        ),
      ),

    );
  }


}