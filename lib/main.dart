import 'package:flutter/material.dart';
import 'package:movie_app_flutter/pages/film_detail.dart';
import 'package:movie_app_flutter/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/filmDetail': (context) => FilmDetail(),
  },
));