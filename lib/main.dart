import 'package:flutter/material.dart';
import 'package:movie_app_flutter/pages/home.dart';
import 'package:movie_app_flutter/pages/profile_page.dart';
import 'package:movie_app_flutter/pages/search_page.dart';
import 'package:movie_app_flutter/services/route_generator.dart';
import 'package:movie_app_flutter/widgets/bottom_navbar.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
    debugShowCheckedModeBanner: false,
  ),
);

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

int pageIndex = 0;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Home(),
      const SearchPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavbar(
        activeIndex: pageIndex,
        homeButton: () {
          setState(() {
            pageIndex = 0;
          });
        },
        searchButton: () {
          setState(() {
            pageIndex = 1;
          });
        },
        profileButton: () {
          setState(() {
            pageIndex = 2;
          });
        },
      ),
    );
  }
}
