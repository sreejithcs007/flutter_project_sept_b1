import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/login_db/Login.dart';
import 'package:flutter_project_sept_b1/login_db/firstpage.dart';
import 'package:google_fonts/google_fonts.dart';

class Stateful_Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Stateful_signup();
}

class _Stateful_signup extends State<Stateful_Signup> {
  String? pwd;
  bool showpwd1 = true;
  bool showpwd2 = true;

  final validkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGN UP"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: validkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Registeration",
                    style: GoogleFonts.lato(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Enter Valid Data",
                    style: GoogleFonts.satisfy(
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                          labelText: "Name",
                          border: OutlineInputBorder(),
                          hintText: "Name"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (email){
                        if(email!.isEmpty || !email.contains("@") || !email.contains("gmail.com")){
                          return "Invalid email";
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                          labelText: "User Name",
                          border: OutlineInputBorder(),
                          hintText: "User Name"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (password){
                        pwd = password;
                        if(password!.isEmpty || password.length < 6){
                          return "password must not be empty or length should be greater than 6";
                        }
                      },

                      obscureText: showpwd1,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              if(showpwd1 == true){
                                showpwd1 = false;
                              }else{
                                showpwd1 = true;
                              }
                            });
                          }, icon: Icon(showpwd1 == true ? Icons.visibility_off : Icons.visibility)),
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          hintText: "Password"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (confirmpassword){
                        if(confirmpassword!.isEmpty || pwd != confirmpassword){
                          return "password must be same";
                        }
                      },

                      obscureText: showpwd2,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(

                          suffixIcon: IconButton(onPressed: (){

                            setState(() {
                              if(showpwd2 == true){
                                showpwd2 = false;
                              }
                              else{
                                showpwd2 = true;
                              }
                            });
                          }, icon: Icon(showpwd2 == true ? Icons.visibility_off : Icons.visibility)),
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(),
                          hintText: "Confirm Password"),
                    ),
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: 170,
                    onPressed: () {
                      final valid = validkey.currentState!.validate();
                      if(valid == true){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Firstpage()));

                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Invalid email / password")));
                      }

                    },
                    color: Colors.red,
                    shape: StadiumBorder(),
                    child: Text("SignUp"),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                              ),
                              children: [
                                TextSpan(text: "Already Have An Account?"),
                                TextSpan(
                                    text: "Login",
                                    style: TextStyle(fontWeight: FontWeight.bold))
                              ])))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}