
import 'package:flutter/material.dart';
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
  List tv = [];

  final String apikey = '7820d399b5158416f9adcc0dc90a6f01';
  final String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ODIwZDM5OWI1MTU4NDE2ZjlhZGNjMGRjOTBhNmYwMSIsIm5iZiI6MTc0MTYwMzU4NS41NTcsInN1YiI6IjY3Y2VjMzAxM2MyNTQ0NDg4MmUzMTMyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UNilSkvsG-SVjTDHncDQ675WQkCSmIwEjgtrwrjrxMg';

  loadmovies()async{
    TMDB tmdbobj = TMDB(ApiKeys(apikey, accessToken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));

    Map trendingresult = await tmdbobj.v3.trending.getTrending();

    setState(() {
      trendingmovies = trendingresult['results'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: const Text('Stream Free Movies'),
      ),
    );
  }
}