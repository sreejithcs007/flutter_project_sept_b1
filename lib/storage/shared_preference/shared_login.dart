import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/storage/shared_preference/home_sharedLOgin.dart';
import 'package:flutter_project_sept_b1/storage/shared_preference/shared_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main(){
  runApp(MaterialApp(home: SharedLogin(),));
}


class SharedLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SharedLoginState ();
}

class _SharedLoginState extends State<SharedLogin> {
  @override
  void initState() {
    user_already_logged_in();
    super.initState();
  }

  final Usercontroller = TextEditingController();
  final passcontroller = TextEditingController();
  late bool loggedin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Login",
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
          ElevatedButton(onPressed: (){
            validate_login();
    },
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)) ,

    // async {
         //    final SharedPreferences prefs = await SharedPreferences
         //        .getInstance()!;
         //    String? username = Usercontroller.text;
         //    String? password = passcontroller.text;
         //    if (username != "" && password != "") {
         //      prefs.setString("user", username);
         //      prefs.setBool("loggedin", true);
         //      Navigator.push(
         //          context, MaterialPageRoute(builder: (context) => Home()));
         //    }
         //
         //    Usercontroller.text = "";
         //    passcontroller.text = "";
         //  },
         //

            child: Text("Login"),
          ),
          TextButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SharedSignup() ));
          },
              child: Text("Dont have an account ? SignUp!!"))
        ],
      ),


    );
  }



  void validate_login() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance()!;
    String username = Usercontroller.text;
    String password = passcontroller.text;
    String? uname = prefs.getString("uname");
    String? paswd= prefs.getString("password");
    if(username == uname && password == paswd){
      prefs.setBool("loggedin", true);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }
  void user_already_logged_in() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance()!;
    ///if first stmt is null execute 2nd statement
    loggedin = prefs.getBool("loggedin")??false;
    if(loggedin == true){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
  }
}