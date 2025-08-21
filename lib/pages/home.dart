import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/services/movie_api.dart';

import '../models/movies.dart';
import '../widgets/carousel_image.dart';
import '../widgets/film_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Movies> moviesPopular = [];
  List<Movies> moviesRegion = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F2027), // #0F2027
            Color(0xFF203A43), // #203A43
            Color(0xFF16232D), // #2C5364
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Movie App",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          foregroundColor: Colors.white,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10.0)),
              CarouselSlider.builder(
                itemCount: moviesPopular.length,
                options: CarouselOptions(
                  height: 500,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final movie = moviesPopular[index];
                  final imagePath = movie.posterPath;
                  final imageUrl = 'https://image.tmdb.org/t/p/w500$imagePath,';
                  return CarouselImage(
                    imageUrl: imageUrl,
                    index: index,
                    movie: movie,
                  );
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  Text(
                    "Popular Movies",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moviesPopular.length,
                  itemBuilder: (context, index) {
                    final movie = moviesPopular[index];
                    final posterPath = movie.posterPath;
                    final imageUrl =
                        'https://image.tmdb.org/t/p/w500$posterPath';
                    return Expanded(
                      child: FilmCard(movie: movie, imageUrl: imageUrl),
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  Text(
                    "Indonesian Most Binge Watch",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                ],
              ),

              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moviesRegion.length,
                  itemBuilder: (context, index) {
                    final movie = moviesRegion[index];
                    final posterPath = movie.posterPath;
                    final imageUrl =
                        'https://image.tmdb.org/t/p/w500$posterPath';
                    return Expanded(
                      child: FilmCard(movie: movie, imageUrl: imageUrl),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchData() async {
    final responseFullMovie = await MovieApi.fetchDataPopularMovies();
    final responseRegionMovie = await MovieApi.fetchDataRegionMovies(
      language: "ID",
    );
    setState(() {
      moviesPopular = responseFullMovie;
      moviesRegion = responseRegionMovie;
    });
  }
}
