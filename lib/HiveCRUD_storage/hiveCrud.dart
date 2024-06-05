import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
 await Hive.initFlutter();
 await Hive.openBox('todo');
 runApp(MaterialApp(home: HiveCrud(),));
}

class HiveCrud extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HiveCrudState();
  
  
}

class _HiveCrudState extends State<HiveCrud> {
  List<Map<String,dynamic>> task = [];
  final tname_cntllr = TextEditingController();
  final tcon_cntllr  = TextEditingController();
  final todobox = Hive.box("todo");
  @override
  void initState() {
    read_refresh_task();
    super.initState();
  }
  read_refresh_task() {
    final task_from_hive =  todobox.keys.map((key){
      final task_from_key = todobox.get(key);
      return{
        'id':key,
        'name':task_from_key['task_name'],
        'content':task_from_key['task_content']
      };

    }
    ).toList();
    setState(() {
      task= task_from_hive.reversed.toList();
    });
   
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("TODO"),
     ),
     body: task.isEmpty? Center(child: CircularProgressIndicator()):ListView.builder
  (itemCount: task.length,
         itemBuilder: (context,index) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.task),
        title: Text(task[index]['name']),
        subtitle: Text(task[index]['content']),
        trailing: Wrap(
          children: [
            IconButton(onPressed: (){
              create_edit_task(task[index]['id']);
              },
                icon: Icon(Icons.edit)),
            IconButton(onPressed: (){
              delete_task(task[index]['id']);
            }, icon: Icon(Icons.delete)),

          ],
        ),
      ),
    );
  }
  ),
     floatingActionButton: FloatingActionButton(onPressed: (){
       create_edit_task(null);
     },
     child: Icon(Icons.add),),
   );
  }

  void create_edit_task(int? itemkey) {
    if(itemkey != null){
      final selected_task = task.firstWhere((element) => element['id'] == itemkey);
      tname_cntllr.text = selected_task['name'];
      tcon_cntllr.text = selected_task['content'];
    }
    showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context, builder: (context){
      return Container(
        padding: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: MediaQuery.of(context).viewInsets.bottom+50),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: tname_cntllr,
            decoration: InputDecoration(
              hintText: "Task Name"
            ),
          ),
          TextField(
            controller: tcon_cntllr,
            decoration: InputDecoration(
              hintText: "Task Content"
            ),
          ),
          ElevatedButton(onPressed: (){
            if(itemkey == null){
              create_task({
                "task_name": tname_cntllr.text.trim(),
                "task_content":tcon_cntllr.text.trim()
              });
            }
            if(itemkey != null){
              edit_task(itemkey,{
                "task_name": tname_cntllr.text.trim(),
                "task_content":tcon_cntllr.text.trim()

              });
            }
            tname_cntllr.text ="";
            tcon_cntllr.text ="";
            Navigator .pop(context);
          }, child: Text(itemkey == null? "Create task " : "Edit task"))
        ],
      ),

      );
    }
    );
  }

  Future<void> create_task(Map<String, String> newtask) async{
    await todobox.add(newtask);
    read_refresh_task();

  }

 Future <void> edit_task(int itemkey, Map<String, String> edittask) async{
    await todobox.put(itemkey, edittask);
    read_refresh_task();
  }

  Future <void> delete_task(int itemkey) async{
    await todobox.delete(itemkey);
    read_refresh_task();
  }
  }

