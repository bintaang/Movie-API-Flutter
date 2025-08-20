import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/movies.dart';

class FilmDetail extends StatelessWidget {
  const FilmDetail({super.key, required this.movies});

  final Movies movies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movies.title),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),

              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
    );
  }
}
