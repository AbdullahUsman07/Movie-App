

import 'package:flutter/material.dart';
import 'package:movie_app/provider/tv-movie-provider.dart';
import 'package:movie_app/utlis/text.dart';
import 'package:provider/provider.dart';

class FavShows extends StatelessWidget {
  const FavShows({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieAndShowProvider>(context);
    final shows = provider.tvshows;

    return Scaffold(
      appBar: AppBar(
        title: Custom_Text(text: 'Favourite Shows', color: Colors.white, font: 26),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: shows.isEmpty? Container():
      GridView.builder(
        itemCount: shows.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
          return Card(
            child: Image(image: NetworkImage(shows[index].posterPath,)),
          );
        }),
    );
  }
}