import 'package:flutter/material.dart';
import 'package:movie_app/models/tvshowMode.dart';
import 'package:movie_app/provider/tv-movie-provider.dart';
import 'package:movie_app/utlis/text.dart';
import 'package:provider/provider.dart';


class ShowDescriptionScreen extends StatefulWidget {
  TvShow show;

  ShowDescriptionScreen({
    super.key,
    required this.show,
  });

  @override
  State<ShowDescriptionScreen> createState() => _ShowDescriptionScreenState();
}

class _ShowDescriptionScreenState extends State<ShowDescriptionScreen> {
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
                      child: Image.network(widget.show.bannerPath, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 2.0,
                    child: Custom_Text(
                      text: '⭐Average Rating - ' + widget.show.rating,
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
                                  provider.toggleFavouriteShow(widget.show);
                                });
                              },
                              icon: Icon(Icons.favorite, color:provider.isFavouriteShow(widget.show.title)? Colors.red : Colors.white),
                            )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Custom_Text(
                text: widget.show.title,
                color: Colors.white,
                font: 23,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Custom_Text(
                text: 'Releasing on - ' + widget.show.date,
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
                  child: Image.network(widget.show.posterPath, fit: BoxFit.fill),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Custom_Text(
                      text: widget.show.description,
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
