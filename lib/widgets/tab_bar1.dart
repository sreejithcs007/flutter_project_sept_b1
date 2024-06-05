import 'package:flutter/material.dart';

import '../grid_View/gridview2.dart';
import '../reg_login/stateful_signup.dart';
void main() {
  runApp(MaterialApp(home: Tabbar1(),));
}

class Tabbar1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TAB_BAR"),
          bottom: const TabBar(tabs: [Text("Chat"),
          Text("CALL"),
            Text("Status"),
          ]),
        ),
        body: //Center(child: Text("Hello"),)
              TabBarView(children: [Stateful_Signup(),
                Gridview2(),
              Text("Hi")]),
        floatingActionButton: Icon(Icons.add),

        
      ),
    );
  }
  
  
}