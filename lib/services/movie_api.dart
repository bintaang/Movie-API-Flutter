import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_flutter/models/movie_genre.dart';
import 'package:movie_app_flutter/models/movies.dart';

const url = 'https://api.themoviedb.org/3/discover/movie';
const bearerToken =
    'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NDY0NTE5ZDA3MDMxM2I3MDRmMjVmNGI5ODJkZTdkNyIsIm5iZiI6MTc1MTUyNzc4MC45NjcsInN1YiI6IjY4NjYzMTY0NjA2ZmMwOTFmOTljMmRiYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KJv1oVDUc16niz2ACUIva8q_TMbnyislZjQ0ZEREZxM';
const apiKey = '8464519d070313b704f25f4b982de7d7';

class MovieApi {
  static Future<List<Movies>> fetchDataPopularMovies() async {
    final newUrl =
        '$url?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc';
    final uri = Uri.parse(newUrl);
    final response = await http.get(
      uri,
      headers: {'Authorization': bearerToken},
    );
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final movies = results.map((e) {
      return Movies(
        posterPath: e['poster_path'] ?? '',
        title: e['title'] ?? 'No Title',
        rating: (e['vote_average'] ?? 0).toDouble() ?? 'No Rating',
        overview: e['overview'] ?? 'No Overview',
      );
    }).toList();
    return movies;
  }

  static Future<List<Movies>> fetchDataRegionMovies({
    required String language,
  }) async {
    final newUrl =
        '$url?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_origin_country=$language';
    final uri = Uri.parse(newUrl);
    final response = await http.get(
      uri,
      headers: {'Authorization': bearerToken},
    );
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final movies = results.map((e) {
      return Movies(
        posterPath: e['poster_path'] ?? '',
        title: e['title'] ?? 'No Title',
        rating: (e['vote_average'] ?? 0).toDouble() ?? 'No Rating',
        overview: e['overview'] ?? 'No Overview',
      );
    }).toList();
    return movies;
  }

  static Future<List<Genres>> fetchGenres() async {
    final url = 'https://api.themoviedb.org/3/genre/movie/list?language=en';
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {'Authorization': bearerToken},
    );
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['genres'] as List<dynamic>;
    final genres = results.map((e) {
      return Genres(name: e['name'], id: e['id']);
    }).toList();
    return genres;
  }

  static Future<List<Movies>> fetchMovieByGenre({required int id}) async {
    final newUrl =
        'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=$id';

    final uri = Uri.parse(newUrl);

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load movies: ${response.body}');
    }

    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;

    return results.map((e) {
      return Movies(
        rating: (e['vote_average'] ?? 0).toDouble(),
        overview: e['overview'] ?? '',
        title: e['title'] ?? 'Untitled',
        posterPath: e['poster_path'],
      );
    }).toList();
  }
}
