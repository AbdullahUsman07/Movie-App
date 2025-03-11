import 'package:flutter/material.dart';
import 'package:movie_app/screens/description.dart';
import 'package:movie_app/utlis/text.dart';

class TrendingMovies extends StatelessWidget {
  TrendingMovies({super.key, required this.trendingmovies});

  List trendingmovies = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom_Text(
            text: 'Watch Trending Movies',
            color: Colors.white,
            font: 23,
          ),
          const SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingmovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DescriptionScreen(
                              bannerUrl:
                                  'https://image.tmdb.org/t/p/w500' +
                                  trendingmovies[index]['backdrop_path'],
                              rating:
                                  trendingmovies[index]['vote_average']
                                      .toString(),
                              title: trendingmovies[index]['title'],
                              release_date:
                                  trendingmovies[index]['release_date'],
                              details: trendingmovies[index]['overview'],
                              poster: 'https://image.tmdb.org/t/p/w500' + trendingmovies[index]['poster_path'],
                            ),
                      ),
                    );
                  },
                  child: trendingmovies[index]['title'] != null ? Container(
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
                                    trendingmovies[index]['poster_path'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Custom_Text(
                          text:
                              trendingmovies[index]['title'] != null
                                  ? trendingmovies[index]['title']
                                  : 'Loading',
                          color: Colors.white,
                          font: 15,
                        ),
                      ],
                    ),
                  ): Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
