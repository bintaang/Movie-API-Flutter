import 'package:flutter/material.dart';
import 'package:movie_app_flutter/main.dart';
import 'package:movie_app_flutter/models/movies.dart';
import 'package:movie_app_flutter/pages/film_detail.dart';
import 'package:movie_app_flutter/pages/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/filmDetail':
        if (args is Movies) {
          return MaterialPageRoute(builder: (_) => FilmDetail(movies: args));
        }
        return _errorRoute();
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(
            child: Text(
              'ERROR, Check the current Argument or the Data that you sent!!',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
