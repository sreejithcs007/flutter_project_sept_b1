import 'package:flutter/material.dart';

import 'db_operations.dart';

void main(){
  runApp(MaterialApp(home: SqfliteCrud(),));
}


class SqfliteCrud extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SqfliteCrudState();

}

class _SqfliteCrudState extends State<SqfliteCrud> {

  final name_ctrl = TextEditingController();
  final phn_cntrl = TextEditingController();
  List<Map<String, dynamic>> contacts = []; ///to store data retrived from db
  var isloading = true;

  @override
  void initState() { ///Initially to show the data at starting
    loadData();   ///to get data from DB
    super.initState();
  }

  void loadData() async{
    final data =await SQLHelper.readData();
    setState(() {
      contacts = data;
      isloading = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY CONTACT"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showsheet(null),
        child: Icon(Icons.add),),
      body: isloading? Text("NO DATA") :
      ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context,index) =>
              Card(child: ListTile(
                title: Text(contacts[index]['name']),
                subtitle: Text(contacts[index]['phone']),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: (){
                      showsheet(contacts[index]['id']);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){
                      delete_contact(contacts[index]['id']);
                    }, icon: Icon(Icons.delete))

                  ],),
              ),)
      ),

    );
  }


  showsheet(int? id) {
    if (id != null) {
      ///to update contact
      var selected_contact = contacts.firstWhere((element) => element['id'] == id);
      name_ctrl.text = selected_contact['name'];
      phn_cntrl.text = selected_contact['phone'];

    }


    showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context, builder: (context) {
      return Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery
                .of(context)
                .viewInsets
                .bottom + 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name_ctrl,
              decoration: InputDecoration(
                  hintText: "Name :"
              ),
            ),
            TextField(
              controller: phn_cntrl,
              decoration: InputDecoration(
                  hintText: "Phone No :"
              ),
            ),
            ElevatedButton(onPressed: () async {
              if (id == null) {
                ///to create contact
                await create_contact();

              }
              if (id != null) {
                ///to update contact
                await update_contact(id);

              }
              // name_ctrl.clear();
              // phn_cntrl.clear();
            },
                child: Text(id == null ? "CREATE CONTACT" : "UPDATE CONTACT"))

          ],
        ),

      );
    }
    );
  }

  Future<void> create_contact() async {
    await SQLHelper.createContact(name_ctrl.text, phn_cntrl.text);
    name_ctrl.clear();
    phn_cntrl.clear();
    Navigator.pop(context);

    loadData();
  }

 Future<void> update_contact(int id) async {
    await SQLHelper.update_Contact(id,name_ctrl.text,phn_cntrl.text);
     name_ctrl.clear();
     phn_cntrl.clear();
    Navigator.pop(context);
    loadData();

 }

  Future<void>delete_contact(int id) async{
    await SQLHelper.deleteContact(id,name_ctrl.text,phn_cntrl.text);
    loadData();
  }
}

