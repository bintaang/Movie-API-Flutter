import 'package:flutter/material.dart';

class FilmDetail extends StatefulWidget {
  const FilmDetail({super.key});

  @override
  State<FilmDetail> createState() => _FilmDetailState();
}

class _FilmDetailState extends State<FilmDetail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        title: Text("Film Detail"),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
        titleTextStyle:
        TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
      ),
        iconTheme:
        IconThemeData(
          color: Colors.white, // Change the color of the back button
        ),
      ),
    );
  }
}
