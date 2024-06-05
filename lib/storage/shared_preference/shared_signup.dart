import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/storage/shared_preference/shared_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedSignup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SharedsignupState();
  }

class _SharedsignupState extends State<SharedSignup> {


  final namecontroller = TextEditingController();
  final Usercontroller = TextEditingController();
  final passcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Signup",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              controller: Usercontroller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                label: Text("Username"),
                suffixIcon: Icon(Icons.person),
                hintText: "Username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passcontroller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                label: Text("Password"),
                hintText: "Password",
                suffixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
          ElevatedButton(onPressed: () {

            storeddata();
          },
          child: Text("Signup"),
          )
        ],
      ),


    );
  }

  void storeddata() async{
    final SharedPreferences pref = await SharedPreferences.getInstance()!;
   //String name = namecontroller.text ;
    String username = Usercontroller.text;
    String password = passcontroller.text;

    if(username != "" && password != ""){
      pref.setString("uname", username);
      pref.setString("password", password);
      //pref.setString("name", name);
      pref.setBool("loggedin", false);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SharedLogin()));
    }

  }
}
