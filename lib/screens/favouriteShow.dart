

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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 2/3), itemBuilder: (context,index){
          return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            child: Image(image: NetworkImage(
                              shows[index].posterPath,),fit: BoxFit.fill,),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            height: 40,
                            width: 150,
                            child: Row(
                              children: [
                                Custom_Text(text: 'Remove', color: Colors.white, font: 20),
                                const SizedBox(width: 26,),
                                IconButton(onPressed: (){
                                  provider.toggleFavouriteShow(shows[index]);
                                }, icon: Icon(Icons.delete,
                                color:Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    );
        }),
    );
  }
}