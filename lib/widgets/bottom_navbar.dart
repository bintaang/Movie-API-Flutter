import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final VoidCallback homeButton;
  final VoidCallback searchButton;
  final VoidCallback profileButton;
  final int activeIndex; // <-- to know which one is active

  const BottomNavbar({
    super.key,
    required this.homeButton,
    required this.searchButton,
    required this.profileButton,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFF203A43),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: homeButton,
            icon: activeIndex == 0
                ? Icon(
                    Icons.home_filled,
                    color: Colors.cyanAccent.shade100.withAlpha(2),
                    shadows: [
                      BoxShadow(
                        color: Colors.cyanAccent,
                        blurRadius: 10.0,
                        spreadRadius: 10.0,
                      ),
                    ],
                    size: 30.0,
                  )
                : Icon(Icons.home_outlined, color: Colors.white, size: 30.0),
          ),

          IconButton(
            onPressed: searchButton,
            icon: activeIndex == 1
                ? Icon(
                    Icons.search_outlined,
                    color: Colors.cyanAccent.shade100.withAlpha(2),
                    shadows: [
                      BoxShadow(
                        color: Colors.cyanAccent,
                        blurRadius: 10.0,
                        spreadRadius: 10.0,
                      ),
                    ],
                    size: 30.0,
                  )
                : Icon(Icons.search_outlined, color: Colors.white, size: 30.0),
          ),
          IconButton(
            onPressed: profileButton,
            icon: activeIndex == 2
                ? Icon(
                    Icons.person_2,
                    color: Colors.cyanAccent.shade100.withAlpha(2),
                    shadows: [
                      BoxShadow(
                        color: Colors.cyanAccent,
                        blurRadius: 10.0,
                        spreadRadius: 10.0,
                      ),
                    ],
                    size: 30.0,
                  )
                : Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                    size: 30.0,
                  ),
          ),
        ],
      ),
    );
  }
}
