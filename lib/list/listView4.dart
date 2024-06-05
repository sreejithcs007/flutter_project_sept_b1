   import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(home: Listview3(),));
}
class Listview3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List view Separator"),
      ),
      body: ListView.separated(
          itemBuilder: (context,index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text("My Contact"),
            );
          },
          separatorBuilder: (context,index){
            if(index % 3 ==0) {
              return Divider(thickness: 5, color: Colors.purple,);
            }
            else{
              return SizedBox();
            }
          },
          itemCount: 10),
    );
  }


}