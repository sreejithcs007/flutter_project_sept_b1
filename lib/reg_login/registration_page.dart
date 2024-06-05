import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back_ios,
            color: Colors.black,),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Registration",
                style: GoogleFonts.nunito(
                    fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Text(" ENTER YOUR DETAILS !!",
                style: GoogleFonts.oxanium(fontSize: 18,
                    fontWeight: FontWeight.bold),),

              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(decoration: InputDecoration(
                    label: Text("Username"),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Username",
                    border: OutlineInputBorder()
                ),),
              ),
               Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextField(decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: Icon(Icons.password),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                    )
                ),),
              ),
               Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextField(decoration: InputDecoration(
                  labelText: "Email",
                  suffixIcon: Icon(Icons.email),
                  hintText: "abc@gmail.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40)
                  )
                ),),
              ),

              MaterialButton(onPressed: () {},
                color: Colors.red,
                shape: StadiumBorder(),
                child: Text("REGISTER"),),
              TextButton(onPressed: () {},
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          children: [
                            TextSpan(text: "Already have an Account!"),
                            TextSpan(text: "signin!",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]
                      )))

            ],
          ),
        )
    );
  }
}