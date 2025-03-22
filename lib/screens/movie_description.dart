import 'package:flutter/material.dart';
import 'package:movie_app/models/movieModel.dart';
import 'package:movie_app/provider/tv-movie-provider.dart';
import 'package:movie_app/utlis/text.dart';
import 'package:provider/provider.dart';



class MovieDescriptionScreen extends StatefulWidget {
  Movie movie;

  MovieDescriptionScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDescriptionScreen> createState() => _MovieDescriptionScreenState();
}

class _MovieDescriptionScreenState extends State<MovieDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieAndShowProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(widget.movie.bannerPath, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 2.0,
                    child: Custom_Text(
                      text: '⭐Average Rating - ' + widget.movie.rating,
                      color: Colors.white,
                      font: 18,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 2,
                    child:
                        IconButton(
                              onPressed: () {
                                setState(() {
                                  provider.toggleFavouriteMovie(widget.movie);
                                });
                              },
                              icon: Icon(Icons.favorite, color:provider.isFavouriteMovie(widget.movie.title)? Colors.red : Colors.white),
                            )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Custom_Text(
                text: widget.movie.title,
                color: Colors.white,
                font: 23,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Custom_Text(
                text: 'Releasing on - ' + widget.movie.date,
                color: Colors.white,
                font: 16,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  height: 200,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image.network(widget.movie.posterPath, fit: BoxFit.fill),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Custom_Text(
                      text: widget.movie.description,
                      color: Colors.white,
                      font: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




