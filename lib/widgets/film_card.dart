import 'package:flutter/cupertino.dart';

import '../models/movies.dart';

class FilmCard extends StatelessWidget {
  const FilmCard({super.key, required this.movie, required this.imageUrl});

  final Movies movie;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed('/filmDetail', arguments: movie);
                  },
                  child: Container(
                    width: 200,
                    height: 300,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
