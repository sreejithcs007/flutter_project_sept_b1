import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/login_db/firstpage.dart';
import 'package:flutter_project_sept_b1/login_db/signupsql.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginState(); 

}

class _LoginState extends State<Login>{
  bool pwd1 = true;

  final validkey = GlobalKey<FormState>(); ///key for the form to validate its state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN PAGE"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: validkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ const Text("Login page",
                style: TextStyle(fontSize: 35),),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  ///value that we type in form field will stored in email
                  validator: (email){
                    if(email!.isEmpty || !email.contains("@") || !email.contains("gmail.com")){
                      return "Invalid email";
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder()
                  ),),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (password){
                    if(password!.isEmpty || password.length < 6){
                      return "password must not be empty or length should be greater than 6";
                    }
                  },
                  obscureText: pwd1,
                  decoration:  InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          if(pwd1 == true){
                            pwd1 = false;
                          }else{
                            pwd1 = true;
                          }
                        });
                      },
                          icon: Icon(pwd1 == true ? Icons.visibility_off : Icons.visibility)),
                      hintText: "Password",
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: (){
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
                  color: Colors.green,
                  shape: const StadiumBorder(),
                  child: Text("Login"),
                ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Stateful_Signup()));
                },
                    child: const Text("Not a user ? Register Here!!"))

              ],
            ),
          ),
        ),
      ),
    );
  }
}