import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/models/movies.dart';

class MovieApi {
  static Future<List<Movies>> fetchData() async {
    const url = 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc';
    const bearerToken = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NDY0NTE5ZDA3MDMxM2I3MDRmMjVmNGI5ODJkZTdkNyIsIm5iZiI6MTc1MTUyNzc4MC45NjcsInN1YiI6IjY4NjYzMTY0NjA2ZmMwOTFmOTljMmRiYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KJv1oVDUc16niz2ACUIva8q_TMbnyislZjQ0ZEREZxM';
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {'Authorization' : bearerToken});
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final movies = results.map((e) {
      return Movies(
        posterPath: e['poster_path'] ?? '',
        title: e['title'] ?? 'No Title',
        rating: e['vote_average']?.toString() ?? 'No Rating',
        overview: e['overview'] ?? 'No Overview',
      );
    }).toList();
    return movies;
  }
}
