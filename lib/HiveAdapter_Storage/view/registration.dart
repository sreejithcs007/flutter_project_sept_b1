import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/HiveAdapter_Storage/model/user_model.dart';
import 'package:flutter_project_sept_b1/HiveAdapter_Storage/view/login.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../database/hivedb.dart';
// void main()async{
//   WidgetsFlutterBinding.ensureInitialized();
//
//   Hive.registerAdapter(UserAdapter());
//   final dbDir = await path_provider.getApplicationDocumentsDirectory();
//   // init hive
//   await Hive.initFlutter(dbDir.path);
//   await Hive.openBox<User>('userData');
//
//   runApp(GetMaterialApp(home: Hive_Reg(),));
// }

class Hive_Reg extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RegState();


}

class RegState extends State<Hive_Reg> {
  final emailcntrl = TextEditingController();
  final passcntrllr= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Register",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: emailcntrl,
              decoration: InputDecoration(
                hintText: "EMAIL",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
            child: TextField(
              controller: passcntrllr,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
            ),
            ),
            ),
            MaterialButton(onPressed: ()async{
              final regUserList = await HiveDb.instance.getUser();
              validate_registration(regUserList);

            },
              color: Colors.grey,
            child: Text("Register"),
            )

          ],
      ),
    );
  }

  void validate_registration(List<User> regUserList) async{
    final enteremail = emailcntrl.text.trim();
    final enterpassword = passcntrllr.text.trim();
    bool userFound = false;
    final validateEmail = EmailValidator.validate(enteremail);
    if(enteremail != '' && enterpassword != ''){
      ///validate email
      if(validateEmail == true){
        await Future.forEach(regUserList, (user) { ///to check email already existing
          if(user.email == enteremail){
            userFound = true;
          }
          else{
            userFound = false;
          }
        }
        );
        if(userFound == true){
          Get.snackbar("Error", "User already existing",colorText: Colors.red);
        }
        else{
          /// to check password
          final validatepassword = check_password(enterpassword);
          if(validatepassword == true){
            final newUser = User(email: enteremail, password: enterpassword);
            await HiveDb.instance.addUser(newUser);
            Get.to(HiveLogin());
            Get.snackbar("Succes", "Registration Successful",colorText: Colors.green);
          }
        }
      }
      else{
        Get.snackbar("Error", "Enter a valid email",colorText: Colors.red);
      }

    }
    else{
      Get.snackbar("Error", "Field must not be empty",colorText: Colors.red);

    }
  }

  bool check_password(String enterpassword) {

    if(enterpassword.length < 6){
      Get.snackbar("error", "password must contain atleast 6 characters",colorText: Colors.red);
      return false;
    }
    else {
      return true;
    }

  }

}