import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> movies = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0950),
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
        backgroundColor: Color(0xFF0C0950),
      ),
      body: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 200.00,
                    height: 300.00,
                    margin: EdgeInsets.all(10.00),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.00),
                    ),
                    child: 
                    Image(image: NetworkImage('https://assets-global.website-files.com/6009ec8cda7f305645c9d91b/6408f6e7b5811271dc883aa8_batman-min.png'),
                      fit: BoxFit.fitWidth,

                    )
                    ,
                  )
                ],
              )
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
    movies = json['results'];
    setState(() {
      movies = movies;
    });
    print(movies);
    print("Data Fetched");
  }
}
