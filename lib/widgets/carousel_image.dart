import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/movies.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({
    super.key,
    required this.imageUrl,
    required this.index,
    required this.movie,
  });

  final String imageUrl;
  final int index;
  final Movies movie;

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF253F49),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).pushNamed('/filmDetail', arguments: movie);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover, // 👈 image auto-fills Expanded
                ),
              ),
            ),
          ),
        ),
        Text(
          movie.title,
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
