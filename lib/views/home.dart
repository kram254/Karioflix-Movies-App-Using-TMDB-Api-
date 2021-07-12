import 'package:flutter/material.dart';
import 'package:retrofit_api/utils/customText.dart';
import 'package:retrofit_api/widgets/topRated.dart';
import 'package:retrofit_api/widgets/trending.dart';
import 'package:retrofit_api/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvShows = [];
  final String apiKey  = 'a7ee06a6f8798c1878f30d3e185219a7';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhN2VlMDZhNmY4Nzk4YzE4NzhmMzBkM2UxODUyMTlhNyIsInN1YiI6IjYwYjRmMmIxYTYxZGUxMDA1N2ExZDZiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mk1tXK_tsujYIypN9OpUlap-yBZYP7W-P78yfWE750g';
  
  @override
  void initState() { 
    super.initState();
    loadMovies();
  }

  loadMovies()async
  {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    )
    );
    Map trendingMoviesResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedMoviesResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResult = await tmdbWithCustomLogs.v3.tv.getLatest();
    
    setState(() {
    trendingMovies  = trendingMoviesResult['results'];
    topRatedMovies  = topRatedMoviesResult['results'];
    tvShows         = tvShowsResult['results'];


    });
    print(trendingMoviesResult);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: CustomText(text: 'KarioFlix', color: Colors.grey, size: 26, ),
      ),
      body: ListView(
        children: [
            TV(tv: tvShows),
            TopRated(toprated: topRatedMovies),  
            TrendingMovies(trending: trendingMovies),
        ],
      ),
        
      
    );
  }
}