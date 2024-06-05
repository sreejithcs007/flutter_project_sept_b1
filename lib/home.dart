import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MaterialApp(home: Home(),));
}
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("My Contacts"),
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.blueAccent,
            child: ListTile(
        title:
        Text("Aswin",),
            subtitle: Text("987654321"),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person),
            ),
            trailing: Icon(Icons.phone),
            ),
          ),
          ListTile(title: Text("Anand"),
          subtitle: Text("2345678"),
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww"),
          ),),
          ListTile(title: Text("Najeeb"),
          subtitle: Text("456789"),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person),
            ),
            trailing: Icon(Icons.phone),
          ),
          ListTile(title: Text("Amith"),
          subtitle: Text("45678"),
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ68xCJyjzwUC0J89fXPOkmIvW09vTZjHRkVg&usqp=CAU"),
              backgroundColor: Colors.green,
              //child: Icon(Icons.person),
            ),
            trailing: Column(
              children: [
                Text("Yesterday"),
                CircleAvatar(
                  // 
                  radius: 10,
                  backgroundColor: Colors.red,
                    child: Text("2"),
                )
              ],
            ),

          ),
          ListTile(title: Text("Gopika"),
            subtitle: Row(
              children: [
                Icon(Icons.done_all,),
                Text("Hi, Are u Fine"),
              ],

            ),
            leading:
            CircleAvatar(child : Icon(Icons.person)),
            trailing: Text("12:27 pm"),

            ),
          ListTile(title: Text("Hameed"),
            subtitle: Text("45678"),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person),
            ),
            trailing: Icon(Icons.phone),
          ),
          ListTile(title: Text("Karthika"),
            subtitle: Row(
              children: [
                Icon(Icons.done_all,color: Colors.blue,),
                Text("Hi, Are u There"),
              ],
              
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person),
            ),
            trailing: Icon(Icons.phone),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [FaIcon(FontAwesomeIcons.google),
            FaIcon(FontAwesomeIcons.facebook),
            FaIcon(FontAwesomeIcons.instagram),
            FaIcon(FontAwesomeIcons.twitter)],
          )
        ],
      ),
    );
  }

}