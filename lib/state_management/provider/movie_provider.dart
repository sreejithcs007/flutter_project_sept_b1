import 'dart:math';
//import 'package:flutter/material.dart';  Not necessary in this
import 'package:flutter/cupertino.dart';
import 'package:flutter_project_sept_b1/state_management/model/movie.dart';

final List<Movie> movielist = List.generate(100, (index) => Movie(
    title: "movie${index+1}", time: "${Random().nextInt(100)+60}minutes")
);
class MovieProvider extends ChangeNotifier{
  final List<Movie> movies = movielist;
  final List<Movie> wishlist = [];

  void add_wishlist(Movie movies) {
    wishlist.add(movies);
    notifyListeners();
  }

  void remove_wishlist(Movie movies) {
    wishlist.remove(movies);
    notifyListeners();
  }


}