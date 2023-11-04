import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/home.dart';
import 'package:flutter_project_sept_b1/registration_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget{
  String username = "admin";
  String password = "admin@123";

  final user_controller = TextEditingController();
  final pass_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios , color: Colors.black,)),
        // Icon(Icons.arrow_back_ios ,
          //color: Colors.black,),
        //elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",
              style: GoogleFonts.satisfy(fontSize: 50 , fontWeight: FontWeight.bold) ,
              ),
              Text("Welcome Back! , Login with your Credential !!", style: GoogleFonts.satisfy(fontSize: 20 ,
                  fontWeight: FontWeight.bold),),

              Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextField(
                  controller: user_controller,
                  decoration: InputDecoration(
                  label: Text("Username"),
                  prefixIcon: Icon(Icons.person),
                 hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)
                  )
                ),),
              ),
               Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  controller: pass_controller,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon:Icon(Icons.password),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                    )
                ),),
              ),
              MaterialButton(onPressed: (){

                if(username == user_controller.text && password == pass_controller.text){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));

                  }
                user_controller.text = "";
                pass_controller.text = "";

              },
                color: Colors.green,
                shape:  StadiumBorder(),
                child: Text("Login"),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
              },
                  child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black , fontSize: 15),
                children: [
                  TextSpan(text: "Don't Have an Account ?"),
                  TextSpan(text: "signup!",
                      style: TextStyle(fontWeight: FontWeight.bold ))
                ]
              )))

            ],
          ),
        ),
      )
      );

  }

}