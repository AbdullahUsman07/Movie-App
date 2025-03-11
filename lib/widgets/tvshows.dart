import 'package:flutter/material.dart';
import 'package:movie_app/screens/description.dart';
import 'package:movie_app/utlis/text.dart';

class TvShows extends StatelessWidget {
  TvShows({super.key, required this.tvShows});

  List tvShows = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custom_Text(
            text: 'Watch Popular TV Shows',
            color: Colors.white,
            font: 23,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvShows.length,
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
                                  tvShows[index]['backdrop_path'],
                              rating:
                                  tvShows[index]['vote_average']
                                      .toString(),
                              title: tvShows[index]['original_name'],
                              release_date:
                                  tvShows[index]['first_air_date'],
                              details: tvShows[index]['overview'],
                              poster: 'https://image.tmdb.org/t/p/w500' + tvShows[index]['poster_path'],
                            ),
                      ),
                    );
                    
                  },
                  child: tvShows[index]['original_name']!= null ? Container(
                    width: 300,
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
                                    tvShows[index]['backdrop_path'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Custom_Text(
                          text:
                              tvShows[index]['original_name'] != null
                                  ? tvShows[index]['original_name']
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
