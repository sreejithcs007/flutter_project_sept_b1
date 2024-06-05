
import 'package:flutter/material.dart';
import 'package:flutter_project_sept_b1/state_management/provider/movie_provider.dart';
import 'package:flutter_project_sept_b1/state_management/view/movie_wishlist.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(ChangeNotifierProvider<MovieProvider>(create: (context)=>MovieProvider(),
  child: MaterialApp(home: MovieMain(),),
  )
  );
}
class MovieMain extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var wishlistt = context.watch<MovieProvider>().wishlist;
    var moviess = context.watch<MovieProvider>().movies;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Wish()));
          }, icon: Icon(Icons.favorite_outlined),
              label: Text("Wishlist${wishlistt.length}")
          ),
          Expanded(child: ListView.builder(
              itemCount: moviess.length,
              itemBuilder: (context,index) {
           // final current_movie = moviess[index];
            return Card
              (
              child: ListTile(
                title: Text(moviess[index].title),
                subtitle: Text(moviess[index].time),
                trailing: IconButton(
                    onPressed: () {
                      if(!wishlistt.contains(moviess[index])){
                        context.read<MovieProvider>().add_wishlist(moviess[index]);

                      }
                      else{
                        context.read<MovieProvider>().remove_wishlist(moviess[index]);
                      }
                    }, icon: Icon(Icons.favorite_outlined,
                  color: wishlistt.contains(moviess[index])? Colors.red: Colors.grey,)),
              ),
            );
          }
          ))
        ],
      ),
    );
  }
}
