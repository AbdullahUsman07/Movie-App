
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movieModel.dart';
import 'package:movie_app/models/tvshowMode.dart';
import 'package:localstorage/localstorage.dart';


class MovieAndShowProvider extends ChangeNotifier{

  final LocalStorage storage;

  List<Movie> _movies = [];
  List<TvShow> _tvshows = [];

  List<Movie> get movies => _movies;
  List<TvShow> get tvshows => _tvshows;

  
  MovieAndShowProvider(this.storage){
    loadMoviefromStorage();
    loadShowsfromStorage();
  }

  void loadMoviefromStorage(){
    var storedmovie = storage.getItem('movies');
    if(storedmovie != null){
      _movies = List<Movie>.from(
        (storedmovie as List).map((movie)=> Movie.fromJson(movie))
      );
      notifyListeners();
    }
  }

  void loadShowsfromStorage(){
    var storedshow = storage.getItem('tvshows');
    if(storedshow != null){
      _tvshows = List<TvShow>.from(
        (storedshow as List).map((tvshow) => TvShow.fromJson(tvshow))
      );
      notifyListeners();
    }
  }
  void saveMovietoStorage(){
    String jsonString = jsonEncode(_movies.map((m)=> m.toJson()).toList());
    storage.setItem('movies',jsonString);
  }

  void saveTvShowstoStorage(){
    String jsonString = jsonEncode(_tvshows.map((tv)=> tv.toJson()).toList());
    storage.setItem('tvshows', jsonString);
  }

  void addmovies(Movie movie){
    _movies.add(movie);
    saveMovietoStorage();
    notifyListeners();
  }

  void addshow(TvShow show){
    _tvshows.add(show);
    saveTvShowstoStorage();
    notifyListeners();
  }

  void deletemovie(String title){
    _movies.removeWhere((movie)=> movie.title == title);
    saveMovietoStorage();
    notifyListeners();
  }

  void deleteShows(String title){
    _tvshows.removeWhere((show)=> show.title == title);
    saveTvShowstoStorage();
    notifyListeners();
  }
  
}