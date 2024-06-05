import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: ListView2(),));
}

class ListView2 extends StatelessWidget{
  var name = ["Anand","Najeeb","Ayyappan","Aswin","Hiba","Gopika","Keerthana","Hameed","Abhirami","Sharon"];
  var msg  = ["hello!","How are you","Where are u","good evening","Can we go","call me","thank u","miss u","Time to sleep","Goodnight"];
 // var date_time = [11.2,21.34,32.45,45.34,56.12,65.33,78.3,88.4,99.3,12.3];
  var date_time = ["1/1/24","Yesterday","11.30 PM","2/12/23","Today","12/1/24","11.45 AM","25/1/24","Yesterday","1/2/24"];
  var images = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThjQA8DnMemvaaPzpuvIAWbEmQO7dNVCCmfQ&usqp=CAU",
                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI9LjgCaR8Qhoi5iHitchRVtolbxbdYYpkCA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7AHVBuDsBIV8-wWxDgGzkCR3CXHJDHhIiaXsmnpWXY-aGhIiHigQd8OC7VnCtFb1Bx5g&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2liqw6vGF2X7BSWrIKB0eF8LJ2NYaiF3irg&usqp=CAU",
  "https://media.istockphoto.com/id/1413248747/photo/young-male-tourist-taking-videos-and-photos-with-his-camera-on-white-salt-in-salt-lake.webp?b=1&s=170667a&w=0&k=20&c=-Z5D4tzc-ERy7-pVl0rMhJQ2Qk2sq7waSyaUOEeb5yY=",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLLvBMA9qYzj49HTm1TJowwE2CrOe-wbCqhG-UiVmPAUVFii4R9IxuAdVk29r1KnDuhfE&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM5_iq8d7iQSu63VhNJodvGjevv_JaFJTE9g&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgfuVT-asGdnpZ2pZ6FNaLtHofVrU3CN8DHg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTThrOYSSR7l8PgwmY0uNYyLCQjRb29ykwnaQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrT0ZyjiIB84MClIuXaEgwzVLjduObAv5x5g&usqp=CAU"];

  // var icons = [Icons.done,
  //   Icons.done_all,
  //   Icons.access_time,
  //   Icons.done_all,
  //   Icons.done,
  //   Icons.done,
  //   Icons.done_all,
  //   Icons.access_time,
  //   Icons.done_all,
  //   Icons.done];

  var icons = [Icon(Icons.done),
  Icon(Icons.done_all,color: Colors.blue,),
    Icon( Icons.access_time),
    Icon(Icons.done_all,color: Colors.blue),
    Icon(Icons.done),
    Icon(Icons.done),
    Icon( Icons.done_all,color: Colors.blue),
    Icon (Icons.access_time),
    Icon(Icons.done_all),
    Icon(Icons.done) ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("ListView 2"),
     ),
     body: ListView(
       children:
         List.generate(10, (index) => ListTile(
           leading:
           CircleAvatar(
             radius: 42,
             backgroundImage: NetworkImage(images[index]),
             //backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
             //child: Icon(Icons.person),
           ),
           title: Text(name[index]),
           subtitle: Row(
             children: [
               icons[index],
              // Icon(icons[index]),
               Text(msg[index]),
             ],
           ),
           trailing: Text(date_time[index]),
           //Text("${date_time[index]}"),
         )
         )
       ,
     ),
   );
  }


}