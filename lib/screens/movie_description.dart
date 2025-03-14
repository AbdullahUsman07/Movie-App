import 'package:flutter/material.dart';
import 'package:movie_app/models/movieModel.dart';
import 'package:movie_app/provider/tv-movie-provider.dart';
import 'package:movie_app/utlis/text.dart';
import 'package:provider/provider.dart';

// class DescriptionScreen extends StatefulWidget {
//   String bannerUrl, rating, title, release_date, details, poster;
//   bool isMovie;
//   bool isFav = false;

//   DescriptionScreen({
//     super.key,
//     required this.bannerUrl,
//     required this.rating,
//     required this.title,
//     required this.release_date,
//     required this.details,
//     required this.poster,
//     required this.isMovie,
//   });

//   @override
//   State<DescriptionScreen> createState() => _DescriptionScreenState();
// }

// class _DescriptionScreenState extends State<DescriptionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<MovieAndShowProvider>(context);
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         child: ListView(
//           children: [
//             Container(
//               height: 250,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     child: Container(
//                       height: 250,
//                       width: MediaQuery.of(context).size.width,
//                       child: Image.network(widget.bannerUrl, fit: BoxFit.cover),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 10.0,
//                     left: 2.0,
//                     child: Custom_Text(
//                       text: '⭐Average Rating - ' + widget.rating,
//                       color: Colors.white,
//                       font: 18,
//                     ),
//                   ),
//                   Positioned(
//                     right: 10,
//                     bottom: 2,
//                     child:
//                         widget.isFav
//                             ? IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   widget.isFav = !widget.isFav;
//                                   if (widget.isMovie) {
//                                     provider.deletemovie(widget.title);
//                                   } else {
//                                     provider.deleteShows(widget.title);
//                                   }
//                                 });
//                               },
//                               icon: Icon(Icons.favorite, color: Colors.red),
//                             )
//                             : IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   widget.isFav = !widget.isFav;
//                                   if (widget.isMovie) {
//                                     provider.addmovies(
//                                       title: widget.title,
//                                       description: widget.details,
//                                       poster: widget.poster,
//                                       banner: widget.bannerUrl,
//                                       rating: widget.rating,
//                                       release: widget.release_date,
//                                     );
//                                   } else {
//                                     provider.addshow(
//                                       title: widget.title,
//                                       description: widget.details,
//                                       poster: widget.poster,
//                                       banner: widget.bannerUrl,
//                                       rating: widget.rating,
//                                       release: widget.release_date,
//                                     );
//                                   }
//                                 });
//                               },
//                               icon: Icon(Icons.favorite, color: Colors.white),
//                             ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               padding: EdgeInsets.all(10.0),
//               child: Custom_Text(
//                 text: widget.title,
//                 color: Colors.white,
//                 font: 23,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Custom_Text(
//                 text: 'Releasing on - ' + widget.release_date,
//                 color: Colors.white,
//                 font: 16,
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(left: 5.0),
//                   height: 200,
//                   width: 120,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   child: Image.network(widget.poster, fit: BoxFit.fill),
//                 ),
//                 Flexible(
//                   child: Container(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Custom_Text(
//                       text: widget.details,
//                       color: Colors.white,
//                       font: 18,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class MovieDescriptionScreen extends StatefulWidget {
  Movie movie;
  bool isFav = false;

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
                        widget.isFav
                            ? IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.isFav = !widget.isFav;
                                  provider.deletemovie(widget.movie.title);
                                });
                              },
                              icon: Icon(Icons.favorite, color: Colors.red),
                            )
                            : IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.isFav = !widget.isFav;
                                  provider.addmovies(widget.movie);
                                });
                              },
                              icon: Icon(Icons.favorite, color: Colors.white),
                            ),
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




