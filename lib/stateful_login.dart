import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Stateful_Login(),));
}
class Stateful_Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Stateful_LoginState();

  }

class _Stateful_LoginState  extends State<Stateful_Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN PAGE"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  if(email!.isEmpty || email.contains("@") || email.contains("gmail.com")){
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
                decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder()
              ),
              ),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: (){},
                color: Colors.green,
                  shape: const StadiumBorder(),
                child: Text("Login"),
              ),
              TextButton(onPressed: (){},
                  child: const Text("Not a user ? Register Here!!"))

            ],
          ),
        ),
      ),
    );
  }

}

