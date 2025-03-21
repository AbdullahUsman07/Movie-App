import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movieModel.dart';
import 'package:movie_app/models/tvshowMode.dart';

class MovieAndShowProvider extends ChangeNotifier {
  //final LocalStorage storage;

  List<Movie> _movies = [];
  List<TvShow> _tvshows = [];

  List<Movie> get movies => _movies;
  List<TvShow> get tvshows => _tvshows;
  

//   MovieAndShowProvider(this.storage) {
//     loadMoviefromStorage();
//     loadShowsfromStorage();
//   }

//  void loadMoviefromStorage() {
//   var storedmovie = storage.getItem('movies');
//   if (storedmovie != null) {
//     List<dynamic> decodedList = jsonDecode(storedmovie);
//     _movies = decodedList.map((movie) => Movie.fromJson(movie)).toList();
//     notifyListeners();
//   }
// }

// void loadShowsfromStorage() {
//   var storedshow = storage.getItem('tvshows');
//   if (storedshow != null) {
//     List<dynamic> decodedList = jsonDecode(storedshow);
//     _tvshows = decodedList.map((tvshow) => TvShow.fromJson(tvshow)).toList();
//     notifyListeners();
//   }
// }

  // void saveMovietoStorage() {
  //   String jsonString = jsonEncode(_movies.map((m) => m.toJson()).toList());
  //   storage.setItem('movies', jsonString);
  // }

  // void saveTvShowstoStorage() {
  //   String jsonString = jsonEncode(_tvshows.map((tv) => tv.toJson()).toList());
  //   storage.setItem('tvshows', jsonString);
  // }

  void addmovies(Movie movie) {
    _movies.add(movie);
    print('movie added');
    notifyListeners();
  }

  void addshow(TvShow show) {
    _tvshows.add(show);
    print('show added');
    notifyListeners();
  }

  void deletemovie(String title) {
    _movies.removeWhere((movie) => movie.title == title);
    print('movie deleted');
    notifyListeners();
  }

  void deleteShows(String title) {
    _tvshows.removeWhere((show) => show.title == title);
    print('show deleted');
    notifyListeners();
  }

  bool isFavouriteMovie(String title){
    return _movies.any((movie)=> movie.title == title);
  }

  bool isFavouriteShow(String title){
    return _tvshows.any((show)=> show.title == title);
  }


  void toggleFavouriteMovie(Movie movie){
    if(isFavouriteMovie(movie.title)){
      _movies.removeWhere((m) => m.title == movie.title);
    }
    else{
      _movies.add(movie);
    }
    notifyListeners();
  }
  

  void toggleFavouriteShow(TvShow show){
    if(isFavouriteShow(show.title)){
      _tvshows.removeWhere((tv) => tv.title == show.title);
    }
    else{
      _tvshows.add(show);
    }
    notifyListeners();
  }
  
}
