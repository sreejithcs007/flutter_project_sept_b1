import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/storage/shared_preference/shared_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? username;
  @override
  void initState() {
    getvalue();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hi $username"),
        actions: [
          IconButton(onPressed: () async {
            final SharedPreferences prefs = await SharedPreferences.getInstance()!;
            prefs.setBool("loggedin",false);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>SharedLogin()));
            }
             , icon: Icon(Icons.logout))
        ],

      ),
    );
  }


    void getvalue() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance()!;

      setState(() {
         username = prefs.getString("uname")!;
      });
    }
  }