import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';

class Wish extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  var wishlisttt = context.watch<MovieProvider>().wishlist;
    return Scaffold(
      appBar: AppBar(
      title: Text("Wishlist"),
      ),
       body:ListView.builder(
         itemCount: wishlisttt.length,
              itemBuilder: (context,index) {
    // final current_movie = moviess[index];
                return Card
    (
                  child: ListTile(
                    title: Text(wishlisttt[index].title),
                    subtitle: Text(wishlisttt[index].time),
                    trailing: IconButton(
                        onPressed: () {
                      if(wishlisttt.contains(wishlisttt[index])){
                          context.read<MovieProvider>().remove_wishlist(wishlisttt[index]);
                       }
                    },
                       icon: Icon(Icons.delete),
                    ),
                  ),

                );
          } ,
      )
    );
  }


}