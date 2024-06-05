import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/HiveAdapter_Storage/view/home.dart';
import 'package:flutter_project_sept_b1/HiveAdapter_Storage/view/registration.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../database/hivedb.dart';
import '../model/user_model.dart';

  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
 final dbDir = await path_provider.getApplicationDocumentsDirectory();
  //init hive
  await Hive.initFlutter(dbDir.path);
  await Hive.openBox<User>('userData');

  runApp(GetMaterialApp(home: HiveLogin(),));
}
class HiveLogin extends StatelessWidget {
  final email_cont = TextEditingController();
  final password_cont = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email_cont,
              decoration: InputDecoration(
                hintText: "EMAIL",
                border: OutlineInputBorder(),
              ),
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
               controller: password_cont,
               decoration: InputDecoration(
                 hintText: "PASSWORD",
                 border: OutlineInputBorder(),
               ),
             ),
           ),
            ElevatedButton(onPressed: () async{
              final regUserList = await HiveDb.instance.getUser();
              validate_login(regUserList);

              },
              child: Text("Login",)
          ),
            TextButton(onPressed: (){
              Get.to(Hive_Reg());
                },
                  child: Text("Don't have an account!! Register here"))
          ],
        ),
      ),
    );
  }

  Future<void> validate_login(List<User>regUserList) async {
    final enteremail = email_cont.text.trim();
    final enterpassword = password_cont.text.trim();
    bool userFound = false;
    if(enteremail != '' && enterpassword != ''){
      await Future.forEach(regUserList, (user) { ///to check email already existing
        if(user.email == enteremail && user.password == enterpassword){
          userFound = true;
        }
        else{
          userFound = false;
        }
      }
      );
      if(userFound == true){
        Get.snackbar("Success", "Login Successful",colorText: Colors.green);
        Get.to(Hivehome());
      }
      else{
        Get.snackbar("Error", "NO USER found",colorText: Colors.red);
      }

    }
    else{
      Get.snackbar("Error", "Email and password field must not be empty",colorText: Colors.red);
    }
  }
}
