
import 'package:flutter/material.dart';
import 'package:movie_app/utlis/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tvshows.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  List trendingmovies = [];
  List topmovies = [];
  List tvshows = [];

  final String apikey = '7820d399b5158416f9adcc0dc90a6f01';
  final String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ODIwZDM5OWI1MTU4NDE2ZjlhZGNjMGRjOTBhNmYwMSIsIm5iZiI6MTc0MTYwMzU4NS41NTcsInN1YiI6IjY3Y2VjMzAxM2MyNTQ0NDg4MmUzMTMyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UNilSkvsG-SVjTDHncDQ675WQkCSmIwEjgtrwrjrxMg';

  loadmovies()async{
    TMDB tmdbobj = TMDB(ApiKeys(apikey, accessToken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));

    Map trendingresult = await tmdbobj.v3.trending.getTrending();
    Map topmoviesresult  = await tmdbobj.v3.movies.getTopRated();
    Map tvresult = await tmdbobj.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topmovies = topmoviesresult['results'];
      tvshows = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Custom_Text(text: 'Enjoy Free Movies', color: Colors.white, font: 26),
        backgroundColor: Colors.transparent,
        elevation: 10.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 230,
              width: double.infinity,
             // color: Colors.green,
              child: Row(
                children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 75),
                      child: Custom_Text(text: 'Abdullah Usman', color: Colors.white, font: 20),
                    ),
                    const SizedBox(height: 5,),
                    Custom_Text(text: 'au87235@gmail.com', color: Colors.white, font: 15),
                  ],
                )
              ],),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.movie),
              title: Custom_Text(text: 'Favorites Movies', color: Colors.white, font: 20),
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Custom_Text(text: 'Favorites Shows', color: Colors.white, font: 20),
            ),

            const SizedBox(height: 250,),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Custom_Text(text: 'Logout', color: Colors.white, font: 20),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Search for any movie or show',
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          
          TvShows(tvShows: tvshows),
          TrendingMovies(trendingmovies: trendingmovies),
          TopRatedMovies(topRated: topmovies),
         // const SizedBox(height: 10,),
        ],
      )
    );
  }
}