import 'package:flutter/material.dart';
import 'package:movie_app_flutter/services/movie_api.dart';

import '../models/movies.dart';

class GenrePage extends StatefulWidget {
  final int id;

  const GenrePage({super.key, required this.id});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  List<Movies> moviesGenres = [];

  @override
  void initState() {
    super.initState();
    filterMoviesByGenre();
  }

  void filterMoviesByGenre() async {
    final responseGenreMovies = await MovieApi.fetchMovieByGenre(id: widget.id);
    setState(() {
      moviesGenres = responseGenreMovies;
    });
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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,

                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: moviesGenres.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.0,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 2.0,
                  ),
                  itemBuilder: (context, index) {
                    final movie = moviesGenres[index];
                    final imagePath = movie.posterPath;
                    final urlImage =
                        'https://image.tmdb.org/t/p/w500$imagePath,';
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed('/filmDetail', arguments: movie);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(urlImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
