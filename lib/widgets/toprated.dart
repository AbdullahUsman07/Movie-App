import 'package:flutter/material.dart';
import 'package:movie_app/models/movieModel.dart';
import 'package:movie_app/screens/movie_description.dart';
import 'package:movie_app/utlis/text.dart';

class TopRatedMovies extends StatelessWidget {
  TopRatedMovies({super.key, required this.topRated});

  List topRated = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom_Text(
            text: 'Watch TopRated Movies',
            color: Colors.white,
            font: 23,
          ),
          const SizedBox(height: 10),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    final movie = Movie(
                      date: topRated[index]['release_date'],
                      title: topRated[index]['title'],
                      rating: topRated[index]['vote_average'].toString(),
                      bannerPath:
                          'https://image.tmdb.org/t/p/w500' +
                          topRated[index]['backdrop_path'],
                      posterPath:
                          'https://image.tmdb.org/t/p/w500' +
                          topRated[index]['poster_path'],
                      description: topRated[index]['overview'],
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => MovieDescriptionScreen(movie: movie),
                      ),
                    );
                  },
                  child:
                      topRated[index]['title'] != null
                          ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            topRated[index]['poster_path'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Custom_Text(
                                  text:
                                      topRated[index]['title'] != null
                                          ? topRated[index]['title']
                                          : 'Loading',
                                  color: Colors.white,
                                  font: 15,
                                ),
                              ],
                            ),
                          )
                          : Container(),
                );
              },
            ),
          ),
        ],
        
      ),
    );
  }
}
