import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie/widgets/coming.dart';
import 'package:movie/widgets/descriptions/storyview.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../ultils/text.dart';
import '../widgets/popular.dart';
import '../widgets/toprated.dart';
import '../widgets/trending.dart';
import '../widgets/tv.dart';

class home_meu extends StatefulWidget {
  const home_meu({Key key}) : super(key: key);

  @override
  State<home_meu> createState() => _home_meuState();
}




class _home_meuState extends State<home_meu> {
  
 
  final String apikey = '7b0fef9238850ec155eaf20c4ac28a92';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YjBmZWY5MjM4ODUwZWMxNTVlYWYyMGM0YWMyOGE5MiIsInN1YiI6IjYzM2Q2MTBjNjg5MjljMDA3YzY5ZTJkNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FrzVGuxY2PX2x1qEINEb1I0JWczX4A7mhKh59tSUhGk';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  List coming1 =[];
  List popular1 =[];
  List people=[];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );


    Map trendingresult = await tmdbWithCustomLogs.v3.discover.getMovies();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    Map tvpopular1 = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    Map coming = await tmdbWithCustomLogs.v3.movies.getUpcoming();
     Map people1 = await tmdbWithCustomLogs.v3.people.getLatest();
  
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
      popular1 = tvpopular1['results'];
      coming1 = coming['results'];
       people= people1['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
     var ekranBilgisi = MediaQuery.of(context);
    final double yukseklik = ekranBilgisi.size.height;
    final double en = ekranBilgisi.size.width;
    
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 248, 248, 248),
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Colors.orange,
        title: Center( 
         child:Padding(
          padding: EdgeInsets.only(top: yukseklik/25,bottom: 30,left: en/30,right: en/30),
        child:  TextField(
              style: TextStyle(fontSize: 13.5),
              decoration: 
              InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search movies",
                prefixIcon: Icon(Icons.search,color: Colors.orange),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
        ),
      ),
      ),
        body:   
        
        
        Container(
          child: ListView(
            children: [
             
              TV1(tv1: popular1),
              TV(tv: tv),
              TrendingMovies(
                trending: trendingmovies,
              ),
              TopRatedMovies(
                toprated: topratedmovies,
              ),
              COMING(coming: coming1),
             
            ],
          ),
        )
        );
  }
}


