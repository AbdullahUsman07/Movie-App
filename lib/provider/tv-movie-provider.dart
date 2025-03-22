import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movieModel.dart';
import 'package:movie_app/models/tvshowMode.dart';

class MovieAndShowProvider extends ChangeNotifier {
  List<Movie> _movies = [];
  List<TvShow> _tvshows = [];

  List<Movie> get movies => _movies;
  List<TvShow> get tvshows => _tvshows;

  MovieAndShowProvider() {
    fetchDataFromFirestore();
  }

  // fetch all the previous stored movies from the cloud firestore
  Future<void> fetchMoviesFromFirestore() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      QuerySnapshot movieSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('movies')
              .get();


      if(movieSnapshot.docs.isEmpty){
        print('no movies found');
      }else{
        print('Fetced movies successful ${movieSnapshot.docs.length}');
      }

      _movies =
          movieSnapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

            return Movie(
              id: doc.id,
              title:data.containsKey('title')? doc['title']: 'No title',
              rating: doc['rating'],
              date: doc['release_date'],
              posterPath: doc['poster'],
              bannerPath: doc['banner'],
              description: doc['description'],
            );
          }).toList();
      notifyListeners();
    } catch (e) {
      print("cant fetch data");
    }
  }

  // fetch all the previous stored tvshows from the cloud firestore
  Future<void> fetchShowsFromFirestore() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      QuerySnapshot showsnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('shows')
              .get();

      if(showsnapshot.docs.isEmpty){
        print('no movies found');
      }else{
        print('Fetced movies successful ${showsnapshot.docs.length}');
      }

      _tvshows =
          showsnapshot.docs.map((doc) {
            return TvShow(
              id: doc.id,
              title: doc['title'],
              rating: doc['rating'],
              date: doc['release_date'],
              posterPath: doc['poster'],
              bannerPath: doc['banner'],
              description: doc['description'],
            );
          }).toList();

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchDataFromFirestore() async {
    await fetchMoviesFromFirestore();
    await fetchShowsFromFirestore();
  }

  Future<void> addMovieToCollection(Movie movie) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('movies')
        .doc(movie.id)
        .set({
          'title': movie.title,
          'rating': movie.rating,
          'poster': movie.posterPath,
          'banner': movie.bannerPath,
          'description': movie.description,
          'release_date': movie.date,
        });
  }

  Future<void> addShowToCollection(TvShow show) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('shows')
        .doc(show.id)
        .set({
          'title': show.title,
          'rating': show.rating,
          'poster': show.posterPath,
          'banner': show.bannerPath,
          'description': show.description,
          'release_date': show.date,
        });
  }

  Future<void> deleteMovieFromCollection(String movieid) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('movies')
        .doc(movieid)
        .delete();
  }

  Future<void> deleteShowFromCollection(String showid) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('shows')
        .doc(showid)
        .delete();
  }

  void addmovies(Movie movie) async {
    _movies.add(movie);
    await addMovieToCollection(movie);
    print('movie added');
    notifyListeners();
  }

  void addshow(TvShow show) async {
    _tvshows.add(show);
    await addShowToCollection(show);
    print('show added');
    notifyListeners();
  }

  bool isFavouriteMovie(String title) {
    return _movies.any((movie) => movie.title == title);
  }

  bool isFavouriteShow(String title) {
    return _tvshows.any((show) => show.title == title);
  }

  void toggleFavouriteMovie(Movie movie) {
    if (isFavouriteMovie(movie.title)) {
      _movies.removeWhere((m) => m.title == movie.title);
      deleteMovieFromCollection(movie.id);
    } else {
      addmovies(movie);
    }
    notifyListeners();
  }

  void toggleFavouriteShow(TvShow show) {
    if (isFavouriteShow(show.title)) {
      _tvshows.removeWhere((tv) => tv.title == show.title);
      deleteShowFromCollection(show.id);
    } else {
      addshow(show);
    }
    notifyListeners();
  }
}


  // void deletemovie(String title) {
  //   _movies.removeWhere((movie) => movie.title == title);
  //   print('movie deleted');
  //   notifyListeners();
  // }

  // void deleteShows(String title) {
  //   _tvshows.removeWhere((show) => show.title == title);
  //   print('show deleted');
  //   notifyListeners();
  // }



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