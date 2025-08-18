import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/models/movies.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Movies> movies = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text("Movie App",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0)),
                Text(
                  "Popular Movies",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  Padding(padding: EdgeInsets.all(10.0));
                  final movie = movies[index];
                  final tittle = movie.title;
                  final posterPath = movie.posterPath;
                  final imageUrl = 'https://image.tmdb.org/t/p/w500$posterPath,';
                  final rating = movie.rating;
                  final overview = movie.overview ?? 'No Overview';
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 250,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        )
    );
  }
  Future<void> fetchData() async {
    const url = 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc';
    const bearerToken = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NDY0NTE5ZDA3MDMxM2I3MDRmMjVmNGI5ODJkZTdkNyIsIm5iZiI6MTc1MTUyNzc4MC45NjcsInN1YiI6IjY4NjYzMTY0NjA2ZmMwOTFmOTljMmRiYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KJv1oVDUc16niz2ACUIva8q_TMbnyislZjQ0ZEREZxM';
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {'Authorization' : bearerToken});
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transform = results.map((e) {
      return Movies(
        posterPath: e['poster_path'] ?? '',
        title: e['title'] ?? 'No Title',
        rating: e['vote_average']?.toString() ?? 'No Rating',
        overview: e['overview'] ?? 'No Overview',
      );
    }).toList();
    setState(() {
      movies = transform;
    });
    print(movies);
    print("Data Fetched");
  }
}
