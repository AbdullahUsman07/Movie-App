import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/firebase/firebaseAuth.dart';
import 'package:movie_app/screens/favouriteMovies.dart';
import 'package:movie_app/screens/favouriteShow.dart';
import 'package:movie_app/screens/openingpage.dart';
import 'package:movie_app/utlis/text.dart';
import 'package:movie_app/widgets/LoadButton.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tvshows.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  UserAuth auth = UserAuth();

  List trendingmovies = [];
  List topmovies = [];
  List tvshows = [];
  int topmoviePage = 1, trendingmoviePage = 1, tvshowPage = 1;

  final String apikey = '7820d399b5158416f9adcc0dc90a6f01';
  final String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ODIwZDM5OWI1MTU4NDE2ZjlhZGNjMGRjOTBhNmYwMSIsIm5iZiI6MTc0MTYwMzU4NS41NTcsInN1YiI6IjY3Y2VjMzAxM2MyNTQ0NDg4MmUzMTMyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UNilSkvsG-SVjTDHncDQ675WQkCSmIwEjgtrwrjrxMg';

  loadmovies() async {
    TMDB tmdbobj = TMDB(
      ApiKeys(apikey, accessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    Map trendingresult = await tmdbobj.v3.trending.getTrending();
    Map topmoviesresult = await tmdbobj.v3.movies.getTopRated();
    Map tvresult = await tmdbobj.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topmovies = topmoviesresult['results'];
      tvshows = tvresult['results'];
    });
  }

  getmoreTopMovies() async {
    topmoviePage++; // Increment page number
    TMDB tmdbobj = TMDB(ApiKeys(apikey, accessToken));
    Map topmoviesresult = await tmdbobj.v3.movies.getTopRated(
      page: topmoviePage,
    );

    setState(() {
      topmovies.addAll(topmoviesresult['results']);
    });
  }

  getmoreTrendingMovies() async {
    trendingmoviePage++;

    TMDB tmdbobj = TMDB(ApiKeys(apikey, accessToken));
    Map trendingresult = await tmdbobj.v3.trending.getTrending(
      page: trendingmoviePage,
    );

    setState(() {
      trendingmovies.addAll(trendingresult['results']);
    });
  }

  getMoreTvShows() async {
    tvshowPage++;
    TMDB tmdbobj = TMDB(ApiKeys(apikey, accessToken));
    Map showresults = await tmdbobj.v3.tv.getPopular(page: tvshowPage);

    setState(() {
      tvshows.addAll(showresults['results']);
    });
  }


  // getting the current logged in user's data to show in the drawer
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Custom_Text(
          text: 'Enjoy Free Movies',
          color: Colors.white,
          font: 26,
        ),
        backgroundColor: Colors.transparent,
        elevation: 10.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(radius: 60),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 75),
                        child: Custom_Text(
                          text: user?.displayName?? 'No name',
                          color: Colors.white,
                          font: 20,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Flexible(
                        child: Custom_Text(
                          text: user?.email?? 'default@gmail.com',
                          color: Colors.white,
                          font: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavMovies()),
                  );
                },
                icon: Icon(Icons.movie),
              ),
              title: Custom_Text(
                text: 'Favorites Movies',
                color: Colors.white,
                font: 20,
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavShows()),
                  );
                },
                icon: Icon(Icons.tv),
              ),
              title: Custom_Text(
                text: 'Favorites Shows',
                color: Colors.white,
                font: 20,
              ),
            ),

            const SizedBox(height: 250),
            Divider(),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  auth.signout(context);
                },
                icon: Icon(Icons.logout),
              ),
              title: Custom_Text(text: 'Logout', color: Colors.white, font: 20),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Search for any movie or show',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          TvShows(tvShows: tvshows),
          LoadMoreButton(onPressed: getMoreTvShows),
          TrendingMovies(trendingmovies: trendingmovies),
          LoadMoreButton(onPressed: getmoreTrendingMovies),
          TopRatedMovies(topRated: topmovies),
          LoadMoreButton(onPressed: getmoreTopMovies),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
